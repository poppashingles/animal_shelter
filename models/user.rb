require_relative('../db/sql_runner.rb')

class User

  attr_reader :id
  attr_accessor :name, :password

  def initialize(params)
    @id = params['id'].to_i()
    @name = params['name']
    @password = params['password']
  end

  def save()
    sql = "INSERT INTO users (name, password)
          VALUES ($1, $2) RETURNING *"
    values = [@name, @password]
    user_data = SqlRunner.run(sql, values)[0]
    @id = user_data['id'].to_i()
  end

  def self.find(name, password)
    sql = "SELECT * FROM users
          WHERE name = $1 and password = $2"
    values = [name, password]
    result = SqlRunner.run(sql, values)[0]
    return User.new(result)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM users
          WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return User.new(result)
  end

end
