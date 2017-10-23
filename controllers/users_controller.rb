require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/user.rb')

get '/sessions/login' do
  erb(:"users/index")
end

get '/sessions/logout' do
  session.clear
  redirect to('animals/index')
end

post '/sessions' do
  @user = User.find(params["name"], params["password"])
  session[:id] = @user.id
  session[:name] = @user.name
  redirect to('/animals/index')
end
