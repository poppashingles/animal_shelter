require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('controllers/animal_controller.rb')
require_relative('controllers/owner_controller.rb')
require_relative('controllers/users_controller.rb')

# before '/*' do
#   unless request.path_info == '/sessions/login'
#     redirect to('/sessions/login')
#   end
# end

get '/' do
  @animals = Animal.all()
  erb(:"animals/index")
end
