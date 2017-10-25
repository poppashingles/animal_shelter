require_relative('../db/sql_runner.rb')

class Owner

  attr_reader :id
  attr_accessor :first_name, :last_name, :address, :email, :photo_url, :phone_number

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

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)[0]
    return Owner.new(results)
  end

  def update()
    sql = "UPDATE owners
    SET (first_name, last_name, address, email, photo_url, phone_number) =
    ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@first_name, @last_name, @address, @email, @photo_url, @phone_number, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find_by_name(search)
    sql = "SELECT * FROM owners WHERE
    first_name = $1 OR last_name = $1 OR address = $1 OR email = $1 OR phone_number = $1"
    values = [search.capitalize]
    results = SqlRunner.run(sql, values)
    return results.map { |owner| Owner.new(owner)}
  end

end
