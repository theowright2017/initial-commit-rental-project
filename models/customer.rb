require_relative( '../db/sqlrunner' )

class Customer

  attr_reader( :id)
  attr_accessor(:name)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    # @item_rented = options['item_rented']
  end

  def save()
    sql = "INSERT INTO customers
              (name)
              VALUES
               ($1)
                RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def rental_items()
    sql = "SELECT * FROM stock_items i INNER JOIN rentals r
    ON r.stock_item_id = i.id
    WHERE r.stock_item_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |item| StockItem.new(item) }
  end


  def delete()
    sql = "DELETE FROM rentals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def update()
    sql = "UPDATE customers
    SET
      name
     =
      $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end


  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map{ |customer| Customer.new(customer) }
  end


  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results.first)
  end







end
