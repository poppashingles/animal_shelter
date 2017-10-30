require('pg')
class SqlRunner

  def self.run( sql, values )
    begin
      db = PG.connect({ dbname: 'd1ods88rld8ccr', password: 'ce69322e974540be9cf11ea5ae9117babf359a0cd58b95da094d352d365da0e6', port: 5432, host: 'ec2-184-73-247-240.compute-1.amazonaws.com' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close
    end
    return result
  end

end
