require_relative('owner.rb')
require_relative('../db/sql_runner')

class Animal

  attr_reader :id, :owner_id
  attr_accessor :name, :type, :adoptable, :admission_date, :adopted_date, :photo_url

  def initialize(params)
    @id = params['id'].to_i()
    @name = params['name']
    @type = params['type']
    @adoptable = params['adoptable']
    @admission_date = params['admission_date']
    # @adopted_date = params['adopted_date']
    @photo_url = params['photo_url']
    @owner_id = params['owner_id'].to_i()
  end

  def save()
    sql = "INSERT INTO animals (name, type, adoptable, admission_date, photo_url, owner_id)
          VALUES($1, $2, $3, $4, $5, $6) RETURNING *"
    values = [@name, @type, @adoptable, @admission_date, @photo_url, @owner_id]
    animal_data = SqlRunner.run(sql, values)[0]
    @id = animal_data['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM animals"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map { |animal| Animal.new(animal)}
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)[0]
    return Animal.new(results)
  end

  def update()
    sql = "UPDATE animals
    SET (name, type, adoptable, admission_date, photo_url, owner_id) =
    ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @type, @adoptable, @admission_date, @photo_url, @owner_id, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def owner()
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_id]
    owner = SqlRunner.run(sql, values)[0]
    result = Owner.new(owner)
    return result
  end

  def self.find_by_owner(owner_id)
    sql = "SELECT * FROM animals WHERE owner_id = $1"
    values = [owner_id]
    result = SqlRunner.run(sql, values)
    return result.map { |animal| Animal.new(animal)}
  end

  def self.adoptable(adoptable)
    sql = "SELECT * FROM animals WHERE adoptable = $1"
    values = [adoptable]
    results = SqlRunner.run(sql, values)
    return results.map { |animal| Animal.new(animal)}
  end

  def self.find_by_name(search)
    sql = "SELECT * FROM animals WHERE name LIKE $1 OR type LIKE $1"
    values = [search.capitalize]
    results = SqlRunner.run(sql, values)
    return results.map { |animal| Animal.new(animal)}
  end

end
