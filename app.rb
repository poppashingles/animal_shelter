require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('controllers/animal_controller.rb')
require_relative('controllers/owner_controller.rb')
require_relative('controllers/users_controller.rb')

get '/' do
  @animals = Animal.all()
  # @user = User.find_by_id(params[:session_id])
  erb(:"animals/index")
end
