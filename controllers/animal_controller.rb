require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/animal.rb')

get '/animals/index' do
  @animals = Animal.all()
  erb(:"animals/index")
end

get '/animals/new' do
  erb(:"animals/new")
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:"animals/create")
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

post '/animals/:id' do
  Animal.new(params).update()
  redirect to '/animals/index'
end

post '/animals/:id/delete' do
  animal = Animal.find(params[:id])
  animal.delete()
  redirect to '/animals/index'
end
