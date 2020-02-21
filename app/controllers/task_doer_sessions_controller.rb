class TaskDoerSessionsController < ApplicationController
  skip_before_action(:force_task_doer_sign_in, { :only => [:new_session_form, :add_cookie] })

  def new_session_form
    render({ :template => "task_doer_sessions/sign_in.html.erb" })
  end

  def add_cookie
    task_doer = TaskDoer.where({ :email => params.fetch("email_from_query") }).at(0)
    
    the_supplied_password = params.fetch("password_from_query")
    
    if task_doer != nil
      are_they_legit = task_doer.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/task_doer_sign_in", { :alert => "Password incorrect." })
      else
        session.store(:task_doer_id, task_doer.id)
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/task_doer_sign_in", { :alert => "There's no task_doer account with that email address." })
    end
  end

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
