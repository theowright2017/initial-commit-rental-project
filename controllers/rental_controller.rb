require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/rental.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/stock_item.rb' )
also_reload( '../models/*' )

get '/rentals' do
  @rentals = Rental.all
  erb(:'rentals/index')
end

get '/rentals/new' do
  @stock = StockItem.all()
  @customers = Customer.all()
  erb(:'/rentals/new')
end

post '/rentals/new' do
  @stock = StockItem.all()
  @customers = Customer.all()
  erb(:'/rentals/new')
end

post '/rentals' do
  rental = Rental.new(params)
  rental.save()
  
  redirect ('/rentals')
end

post '/rentals/:id/delete' do
  Rental.delete(params[:id])
  redirect (:'/rentals')
end
