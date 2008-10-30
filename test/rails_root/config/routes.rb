ActionController::Routing::Routes.draw do |map|

  map.resources :users, :member => { :edit_password => :get, :change_password => :put }
  map.resources :passwords

  map.confirmations '/confirmations/:confirmation_code', :controller => 'confirmations', :action => 'confirm', :conditions => {:method => :get}

  map.resource :session

  map.root :controller => 'users', :action => 'new'

end
