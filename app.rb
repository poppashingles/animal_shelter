require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('controllers/animal_controller.rb')
require_relative('controllers/owner_controller.rb')
require_relative('controllers/users_controller.rb')
require_relative('controllers/search_controller.rb')

enable :sessions

before '/*' do
  if session[:name] == nil && request.path_info != '/sessions/login' && request.path_info != '/sessions'
    redirect to('/sessions/login')
  end
end

get '/' do
  @animals = Animal.all()
  erb(:"animals/index")
end
