class TaskDoersController < ApplicationController
  skip_before_action(:force_task_doer_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "task_doer_sessions/sign_up.html.erb" })
  end

  def create
    @task_doer = TaskDoer.new
    @task_doer.email = params.fetch("email_from_query")
    @task_doer.password = params.fetch("password_from_query")
    @task_doer.password_confirmation = params.fetch("password_confirmation_from_query")
    @task_doer.name = params.fetch("name_from_query")
    @task_doer.about = params.fetch("about_from_query")

    save_status = @task_doer.save

    if save_status == true
      session.store(:task_doer_id,  @task_doer.id)
   
      redirect_to("/", { :notice => "Task doer account created successfully."})
    else
      redirect_to("/task_doer_sign_up", { :alert => "Task doer account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "task_doers/edit_profile.html.erb" })
  end

  def update
    @task_doer = @current_task_doer
    @task_doer.email = params.fetch("email_from_query")
    @task_doer.password = params.fetch("password_from_query")
    @task_doer.password_confirmation = params.fetch("password_confirmation_from_query")
    @task_doer.name = params.fetch("name_from_query")
    @task_doer.about = params.fetch("about_from_query")
    
    if @task_doer.valid?
      @task_doer.save

      redirect_to("/", { :notice => "Task doer account updated successfully."})
    else
      render({ :template => "task_doers/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_task_doer.destroy
    reset_session
    
    redirect_to("/", { :notice => "TaskDoer account cancelled" })
  end
  
end
