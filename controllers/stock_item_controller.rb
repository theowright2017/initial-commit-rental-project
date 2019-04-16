require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/rental.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/stock_item.rb' )
also_reload( '../models/*' )

get '/stock' do
  @stock = StockItem.all()
  erb(:'stock_items/index')
end

get '/stock/new' do
  @stock = ["Standard", "Sports Bike", "Tourer"]
  @rented = ["available", "out for rent"]
  erb(:'/stock_items/new')
end

post '/stock' do
  stock = StockItem.new(params)
  stock.save
  redirect to "/stock"
end

get '/stock/:id/edit' do
  @stock = StockItem.find(params[:id])
  erb(:'/stock_items/edit')
end

post '/stock/:id/edit' do
  stock = StockItem.new(params)
  stock.update()
  redirect to '/stock'
end
# this takes the new instance of stockitem, inputs the parameters taken from the get, (where the form is from) and updates it into the database

post '/stock/:id/delete' do
  StockItem.delete(params[:id])
  redirect to "/stock"
end
