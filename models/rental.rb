require_relative( '../db/sqlrunner' )

class Rental

  attr_reader( :id, :customer_id, :stock_item_id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @stock_item_id = options['stock_item_id'].to_i
  end

  def save()
    sql = "INSERT INTO rentals
            (
              customer_id,
              stock_item_id
              )
              VALUES
              (
               $1, $2
                )
                RETURNING id"
    values = [@customer_id, @stock_item_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end


  def delete()
    sql = "DELETE FROM rentals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def item()
    sql = "SELECT * FROM stock_items
    WHERE id = $1"
    values = [@stock_item_id]
    results = SqlRunner.run(sql, values)
    return StockItem.new(results[0])
  end

def customer()
  sql = "SELECT * FROM customers WHERE id = $1"
  values = [@customer_id]
  results = SqlRunner.run(sql, values)
  return Customer.new(results[0])
end

def self.delete(id)
  sql = "DELETE FROM rentals WHERE id = $1"
  values = [id]
  SqlRunner.run(sql, values)
end



  def self.all()
    sql = "SELECT * FROM rentals"
    results = SqlRunner.run(sql)
    return results.map{ |rental| Rental.new(rental) }
  end


  def self.delete_all()
    sql = "DELETE FROM rentals"
    SqlRunner.run(sql)
  end

end
