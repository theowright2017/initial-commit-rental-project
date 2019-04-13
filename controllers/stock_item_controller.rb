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
  @stock = StockItem.all()
  erb(:'/stock_items/new')
end

post '/stock/new' do
  @stock = StockItem.all()
  erb(:'/stock_items/new')
end



post '/stock' do
  stock = StockItem.new(params)
  stock.save
  redirect to("/stock")
end

post '/stock/:id/delete' do
  StockItem.delete(params[:id])
  redirect (:'/stock')
end
