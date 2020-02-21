class ProducersController < ApplicationController
  # skip_before_action(:force_producer_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "producer_sessions/sign_up.html.erb" })
  end

  def create
    @producer = Producer.new
    @producer.email = params.fetch("query_email")
    @producer.password = params.fetch("query_password")
    @producer.password_confirmation = params.fetch("query_password_confirmation")
    @producer.name = params.fetch("query_name")
    @producer.about = params.fetch("query_about")
    @producer.dob = params.fetch("query_dob")

    save_status = @producer.save

    if save_status == true
      session.store(:producer_id,  @producer.id)
   
      redirect_to("/", { :notice => "Producer account created successfully."})
    else
      redirect_to("/producer_sign_up", { :alert => "Producer account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "producers/edit_profile.html.erb" })
  end

  def update
    @producer = @current_producer
    @producer.email = params.fetch("query_email")
    @producer.password = params.fetch("query_password")
    @producer.password_confirmation = params.fetch("query_password_confirmation")
    @producer.name = params.fetch("query_name")
    @producer.about = params.fetch("query_about")
    @producer.dob = params.fetch("query_dob")
    
    if @producer.valid?
      @producer.save

      redirect_to("/", { :notice => "Producer account updated successfully."})
    else
      render({ :template => "producers/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_producer.destroy
    reset_session
    
    redirect_to("/", { :notice => "Producer account cancelled" })
  end
  
end
