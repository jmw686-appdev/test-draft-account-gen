class ProducerSessionsController < ApplicationController
  # skip_before_action(:force_producer_sign_in, { :only => [:new_session_form, :add_cookie] })

  def new_session_form
    render({ :template => "producer_sessions/sign_in.html.erb" })
  end

  def add_cookie
    producer = Producer.where({ :email => params.fetch("query_email") }).at(0)
    
    the_supplied_password = params.fetch("query_password")
    
    if producer != nil
      are_they_legit = producer.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/producer_sign_in", { :alert => "Password incorrect." })
      else
        session.store(:producer_id, producer.id)
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/producer_sign_in", { :alert => "There's no producer account with that email address." })
    end
  end

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
