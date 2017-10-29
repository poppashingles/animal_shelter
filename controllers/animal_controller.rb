require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/animal.rb')

get '/animals/index' do
  @animals = Animal.all()
  @success_message = session[:success_message]
  session[:success_message] = nil
  erb(:"animals/index")
end

get '/animals/new' do
  @owners = Owner.all()
  erb(:"animals/new")
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  session[:success_message] = "---Successfully added new animal to the database---"
  redirect to '/animals/index'
end

get '/animals/adoptable' do
  @animals = Animal.adoptable(true)
  erb(:"animals/adoptable")
end

get '/animals/unadoptable' do
  @animals = Animal.adoptable(false)
  erb(:"animals/unadoptable")
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all()
  erb(:"animals/edit")
end

post '/animals/:id' do
  Animal.new(params).update()
  session[:success_message] = "---Successfully updated animal in the database---"
  redirect to '/animals/index'
end

post '/animals/:id/delete' do
  animal = Animal.find(params[:id])
  animal.delete()
  session[:success_message] = "---Successfully deleted animal from the database---"
  redirect to '/animals/index'
end
