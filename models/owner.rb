require_relative('../db/sql_runner.rb')

class Owner

  attr_reader :id
  attr_accessor :first_name, :last_name, :address, :email, :photo_url, :phone

  def initialize(params)
    @id = params['id'].to_i()
    @first_name = params['first_name']
    @last_name = params['last_name']
    @address = params['address']
    @email = params['email']
    @photo_url = params['photo_url']
    @phone = params['phone'].to_i()
  end

end
