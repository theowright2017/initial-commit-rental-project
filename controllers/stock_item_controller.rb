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
