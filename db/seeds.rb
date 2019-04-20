require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require_relative( "../models/stock_item.rb" )


Customer.delete_all()
Rental.delete_all()
StockItem.delete_all()

customer1 = Customer.new({
      "first_name"  =>  "John",
      "last_name" => "Wayne"
      })
customer1.save()

customer2 = Customer.new({
      "first_name"  =>  "Mike",
      "last_name" => "Smith"
      })
customer2.save()

customer3 = Customer.new({
      "first_name"  =>  "Tony",
      "last_name" => "Johnson"
      })
customer3.save()

customer4 = Customer.new({
      "first_name"  =>  "Ashley",
      "last_name" => "White"
      })
customer4.save()

stock_item1 = StockItem.new({
  "name"  =>  "SH 300i",
  "manufacturer"  => "Honda",
  "type"  =>  "Scooter",
  "category_cc" =>  280,
  "max_speed_mph" =>  75,
  "cost_per_week" =>  80,
  "image" =>  "/images/honda sh300i.jpeg",
  "rented"  =>  "f"
  })
  stock_item1.save()

  stock_item2 = StockItem.new({
    "name"  =>  "YZR R1M",
    "manufacturer"  => "Yamaha",
    "type"  =>  "Sports Bike",
    "category_cc" =>  998,
    "max_speed_mph" =>  160,
    "cost_per_week" =>  120,
    "image" =>  "/images/sports_01.jpeg",
    "rented"  =>  "f"
    })
    stock_item2.save()

    stock_item3 = StockItem.new({
      "name"  =>  "F800 GT",
      "manufacturer"  => "BMW",
      "type"  =>  "Tourer",
      "category_cc" =>  798,
      "max_speed_mph" =>  160,
      "cost_per_week" =>  150,
      "image" =>  "/images/tourer_01.jpeg",
      "rented"  =>  "f"
      })
      stock_item3.save()

      stock_item4 = StockItem.new({
        "name"  =>  "Rebel 500",
        "manufacturer"  => "Honda",
        "type"  =>  "Cruiser",
        "category_cc" =>  471,
        "max_speed_mph" =>  180,
        "cost_per_week" =>  165,
        "image" =>  "/images/cruiser_01.jpeg",
        "rented"  =>  "t"
        })
        stock_item4.save()

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
