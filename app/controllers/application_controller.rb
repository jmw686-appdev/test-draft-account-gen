class ApplicationController < ActionController::Base
  before_action(:load_current_task_doer)
  before_action(:force_task_doer_sign_in)
  
  def load_current_task_doer
    the_id = session.fetch(:task_doer_id)
    @current_task_doer = TaskDoer.where({ :id => the_id }).at(0)
  end
  
  def force_task_doer_sign_in
    if @current_task_doer == nil
      redirect_to("/task_doer_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
