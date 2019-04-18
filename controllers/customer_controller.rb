require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/rental.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/stock_item.rb' )
also_reload( '../models/*' )

get '/customers' do
  @customers = Customer.all()
  # binding.pry
  erb ( :"customers/index")
end

get '/customers/new' do
  @customers = Customer.all()
  erb(:'/customers/new')
end

get '/customers/:id' do
  @customer = Customer.find(params['id'].to_i)
  erb (:'customers/show')
end

# get '/customers/search' do
#   @customers = Customer.all()
#   erb(:'customers/search')
# end

post '/customers/search' do
  @customers = Customer.search(params[:input])
  # binding.pry
  erb(:'customers/search')
end

post '/customers' do
  customer = Customer.new(params)
  customer.save()
  redirect ('/customers')
end

get '/customers/:id/edit' do
  @customer = Customer.find(params[:id])
  erb(:'/customers/edit')
end

post '/customers/:id/edit' do
  @customer = Customer.new(params)
  @customer.update()
  redirect to '/customers'
end
# this method is creating a new instance of customer class, using the params we alreay have from customers route. it will then update the database under that customer id for any changes made, essentially we replace the row of data with new input

post '/customers/:id/delete' do
  Customer.delete(params[:id])
  redirect (:'/customers')
end
