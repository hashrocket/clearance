ActionController::Routing::Routes.draw do |map|

  map.resources :users
  map.resources :passwords

  map.confirmations '/users/confirmations/:confirmation_code', :controller => 'confirmations', :action => 'confirm', :conditions => {:method => :get}

  map.resource :session
  map.resource :session_mailer_override
  
  map.resource :account
 
  map.root :controller => 'users', :action => 'new'

end
