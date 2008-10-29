ActionController::Routing::Routes.draw do |map|

  map.resources :users, :member => { :edit_password => :get, :change_password => :put }
  map.resources :passwords

  map.confirmations '/confirmations/:confirmation_code', :controller => 'confirmations', :action => 'confirm', :conditions => {:method => :get}

  map.resource :session
  map.resource :session_mailer_override
  
  map.resource :account
 
  map.root :controller => 'users', :action => 'new'

end
