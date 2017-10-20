require_relative('../sql_runner')

class Animal

  attr_reader :id, :owner_id
  attr_accessor :name, :type, :adoptable, :admission_date, :adopted_date, :photo_url

  def initalize(params)
    @id = params['id'].to_i()
    @name = params['name']
    @type = params['type']
    @adoptable = params['adoptable']
    @admission_date = params['admission_date']
    @adopted_date = params['adopted_date']
    @photo_url = params['photo_url']
    @owner_id = params['owner_id'].to_i()
  end

end
