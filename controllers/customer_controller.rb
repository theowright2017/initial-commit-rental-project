require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/rental.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/stock_item.rb' )
also_reload( '../models/*' )

get '/customers' do
  @customers = Customer.all()
  erb ( :"customers/index")
end

get '/customers/:id' do
  @customer = Customer.find(params['id'].to_i)
  erb (:'customers/show')
end
