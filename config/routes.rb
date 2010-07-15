ActionController::Routing::Routes.draw do |map|
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  
  map.resources :questions

  map.resources :exams do |exams|
    exams.resources :test_sessions
  end

  map.resources :users
  map.resource :user_session

  map.root :controller => "exams"
end
