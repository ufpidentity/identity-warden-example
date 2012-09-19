Banana::Application.routes.draw do
  get '/logout', :to => "login#logout"
  get '/login', :to => "login#new"
  post '/login', :to => "login#login"
end
