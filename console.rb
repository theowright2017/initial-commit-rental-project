require( 'sinatra' )
require('sinatra/contrib/all') if development?
require_relative('controllers/customer_controller')
require_relative('controllers/rental_controller')
require_relative('controllers/stock_item_controller')
also_reload( './models/*' )

get '/' do
  erb( :index )
end
