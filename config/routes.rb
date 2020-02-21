Rails.application.routes.draw do
  # Routes for the Task doer account:

  # Sign up form
  get("/task_doer_sign_up", { :controller => "task_doers", :action => "new_registration_form" })
  
  # Create record
  get("/insert_task_doer", { :controller => "task_doers", :action => "create"  })

  # Sign in form
  get("/task_doer_sign_in", { :controller => "task_doer_sessions", :action => "new_session_form" })
  
  # Authenticate and store cookie
  post("/task_doer_verify_credentials", { :controller => "task_doer_sessions", :action => "add_cookie" })
  
  # Sign out        
  get("/task_doer_sign_out", { :controller => "task_doer_sessions", :action => "remove_cookies" })
  
         
  # Edit profile form        
  get("/edit_task_doer_profile", { :controller => "task_doers", :action => "edit_registration_form" })
  
  # Update record
  post("/modify_task_doer", { :controller => "task_doers", :action => "update" })
  
  # Delete record
  get("/cancel_task_doer_account", { :controller => "task_doers", :action => "destroy" })


  #------------------------------

  # Routes for the Task resource:

  # CREATE
  post("/insert_task", { :controller => "tasks", :action => "create" })
          
  # READ
  get("/tasks", { :controller => "tasks", :action => "index" })
  
  get("/tasks/:path_id", { :controller => "tasks", :action => "show" })
  
  # UPDATE
  
  post("/modify_task/:path_id", { :controller => "tasks", :action => "update" })
  
  # DELETE
  get("/delete_task/:path_id", { :controller => "tasks", :action => "destroy" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
