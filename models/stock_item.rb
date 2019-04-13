require_relative( '../db/sqlrunner' )

class StockItem

  attr_reader( :id, :name, :manufacturer, :type, :category_cc, :max_speed_mph, :cost_per_week, :image )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @manufacturer = options['manufacturer']
    @type = options['type']
    @category_cc = options['category_cc'].to_i
    @max_speed_mph = options['max_speed_mph'].to_i
    @cost_per_week = options['cost_per_week'].to_i
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO stock_items
            (
              name,
              manufacturer,
              type,
              category_cc,
              max_speed_mph,
              cost_per_week,
              image
              )
              VALUES
              (
               $1, $2, $3, $4, $5, $6, $7
                )
                RETURNING id"
    values = [@name, @manufacturer, @type, @category_cc, @max_speed_mph, @cost_per_week, @image]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM stock_items WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end




  def self.all()
    sql = "SELECT * FROM stock_items"
    results = SqlRunner.run(sql)
    return results.map{ |stock_item| StockItem.new(stock_item) }
  end



  def self.delete_all()
    sql = "DELETE FROM stock_items"
    SqlRunner.run(sql)
  end

end
