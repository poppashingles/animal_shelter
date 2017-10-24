require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner.rb')

get '/owners/index' do
  @owners = Owner.all()
  erb(:"owners/index")
end

get '/owners/new' do
  erb(:"owners/new")
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save()
  erb(:"owners/create")
end

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:"owners/edit")
end

post '/owners/:id' do
  Owner.new(params).update()
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
  redirect to '/owners/index'
end
