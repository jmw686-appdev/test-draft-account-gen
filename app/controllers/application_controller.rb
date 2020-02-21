class ApplicationController < ActionController::Base
  before_action(:load_current_producer)
  
  # before_action(:force_producer_sign_in)
  
  def load_current_producer
    the_id = session.fetch(:producer_id)
    @current_producer = Producer.where({ :id => the_id }).at(0)
  end
  
  def force_producer_sign_in
    if @current_producer == nil
      redirect_to("/producer_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
