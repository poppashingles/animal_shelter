require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/user.rb')

get '/sessions/login' do
  erb(:"users/index")
end

get '/sessions/logout' do
  session.clear
  redirect to('animals/index')
end

post '/sessions' do
  @is_logged_in = User.authenticate(params["name"], params["password"])

  if(@is_logged_in)
    session[:name] = params["name"]
    redirect to('/animals/index')
  else
    redirect to('/sessions/login')
  end
end
