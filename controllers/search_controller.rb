require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/user.rb')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')

get '/search' do
  search_value = params['search_input']
  @animals = Animal.find_by_name(search_value)
  @owners = Owner.find_by_name(search_value)
  erb(:"search/results")
end
