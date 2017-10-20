require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/animal.rb')

get '/animals' do
  @animals = Animal.all()
  erb(:animals)
end
