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
    @phone_number = params['phone_number']
  end

  def save()
    sql = "INSERT INTO owners (first_name, last_name, address, email, photo_url, phone_number)
          VALUES ($1, $2, $3, $4, $5, $6) RETURNING *"
    values = [@first_name, @last_name, @address, @email, @photo_url, @phone_number]
    owner_data = SqlRunner.run(sql, values)[0]
    @id = owner_data['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM owners"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map { |owner| Owner.new(owner)}
  end

end
