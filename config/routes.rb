Rails.application.routes.draw do
  # Routes for the Producer account:

  # SIGN UP FORM
  get("/producer_sign_up", { :controller => "producers", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_producer", { :controller => "producers", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_producer_profile", { :controller => "producers", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_producer", { :controller => "producers", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_producer_account", { :controller => "producers", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/producer_sign_in", { :controller => "producer_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/producer_verify_credentials", { :controller => "producer_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/producer_sign_out", { :controller => "producer_sessions", :action => "destroy_cookies" })
             
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
