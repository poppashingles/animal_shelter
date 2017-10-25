require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner.rb')

get '/owners/index' do
  @owners = Owner.all()
  @success_message = session[:success_message]
  session[:success_message] = nil
  erb(:"owners/index")
end

get '/owners/new' do
  erb(:"owners/new")
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save()
  session[:success_message] = "---Successfully added new owner to the database---"
  redirect to '/owners/index'
end

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:"owners/edit")
end

post '/owners/:id' do
  Owner.new(params).update()
  session[:success_message] = "---Successfully updated owner in the database---"
  redirect to '/owners/index'
end

get '/owners/:id' do
  @owner = Owner.find(params[:id])
  @animals = Animal.find_by_owner(params[:id])
  erb(:"owners/show")
end

post '/owners/:id/delete' do
  owner = Owner.find(params[:id])
  owner.delete()
  session[:success_message] = "---Successfully deleted owner from the database---"
  redirect to '/owners/index'
end
