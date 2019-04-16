require_relative( '../db/sqlrunner' )

class Customer

  attr_reader( :id)
  attr_accessor(:first_name, :last_name)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO customers
              (first_name, last_name)
              VALUES
               ($1, $2)
                RETURNING id"
    values = [@first_name, @last_name]
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

  def rentals()
    sql = "SELECT * FROM customers c INNER JOIN rentals r
    ON r.customer_id = c.id
    WHERE r.customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |rental| Rental.new(rental)}
  end


  def delete()
    sql = "DELETE FROM rentals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def update()
    sql = "UPDATE customers
    SET
      (first_name, last_name)
     =
      ($1, $2)
    WHERE id = $3"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.search(input)
    sql = "SELECT * FROM customers WHERE (first_name LIKE '%#{input.capitalize}%') OR (last_name LIKE '%#{input.capitalize}%')  "
    results = SqlRunner.run(sql)
    return results.map { |customer| Customer.new(customer) }
  end

  # def Artist.search_bar(input)
  #   #sql = "SELECT * FROM artists WHERE last_name LIKE '#{input}%'"
  #   sql = "SELECT * FROM artists WHERE (first_name LIKE '#{input.capitalize}%') OR (last_name LIKE '#{input.capitalize}%') OR (medium LIKE '#{input.capitalize}%') OR (nationality LIKE '#{input.capitalize}%') OR (style LIKE '#{input.capitalize}%')"
  #   result = SqlRunner.run(sql)
  #   artists = result.map { |artist| Artist.new(artist)  }
  # end

  # def exhibits()
  #   sql = "SELECT exhibits.* FROM exhibits INNER JOIN ex_art ON ex_art.exhibit_id = exhibits.id WHERE ex_art.artist_id = $1"
  #   value = [@id]
  #   result = SqlRunner.run(sql, value)
  #   return result.map{|exhibit| Exhibit.new(exhibit)}
  # end


  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map{ |customer| Customer.new(customer) }
  end

  def self.delete(id)
    sql = "DELETE FROM customers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
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
