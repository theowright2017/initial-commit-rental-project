require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require_relative( "../models/stock_item.rb" )
require("pry-byebug")


Customer.delete_all()
Rental.delete_all()
StockItem.delete_all()

customer1 = Customer.new({
      "name"  =>  "John Wayne"
      })
customer1.save()

customer2 = Customer.new({
      "name"  =>  "Terry Tibbs"
      })
customer2.save()

customer3 = Customer.new({
      "name"  =>  "Tony Montana"
      })
customer3.save()

stock_item1 = StockItem.new({
  "name"  =>  "SH 300i",
  "manufacturer"  => "Honda",
  "type"  =>  "Scooter",
  "category_cc" =>  280,
  "max_speed_mph" =>  75,
  "cost_per_week" =>  80,
  "image" =>  "images/honda sh300i.jpg"
  })
  stock_item1.save()

  stock_item2 = StockItem.new({
    "name"  =>  "PK 650t",
    "manufacturer"  => "Yamaha",
    "type"  =>  "Motorbike",
    "category_cc" =>  650,
    "max_speed_mph" =>  160,
    "cost_per_week" =>  120,
    "image" =>  "images/honda sh300i.jpg"
    })
    stock_item2.save()

    stock_item3 = StockItem.new({
      "name"  =>  "950zi",
      "manufacturer"  => "BMW",
      "type"  =>  "Tourer",
      "category_cc" =>  955,
      "max_speed_mph" =>  160,
      "cost_per_week" =>  150,
      "image" =>  "images/honda sh300i.jpg"
      })
      stock_item3.save()

  rental1 = Rental.new({
    "customer_id" => customer1.id,
    "stock_item_id" =>  stock_item1.id
    })
  rental1.save()

  rental2 = Rental.new({
    "customer_id" => customer2.id,
    "stock_item_id" =>  stock_item3.id
    })
  rental2.save()

  rental3 = Rental.new({
    "customer_id" => customer3.id,
    "stock_item_id" =>  stock_item2.id
    })
  rental3.save()











binding.pry
nil
