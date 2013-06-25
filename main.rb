require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  "Hello! what it do"
end

get '/hello_world' do
  "Hello, World".reverse.upcase
end

get '/hello_me' do
  @me = "Jamal"
  return "Hello, world #{@me.upcase}"
end

get '/hello_you/:name' do
  @name = params[:name]
  return "Hello, #{@name}"
end


get '/names/:first/:last' do
  @first = params[:first]
  @second = params[:second]
  return "you can do multiple parameters,
         #{@first}, #{@last}!"
end

get '/calc/add/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  # Sinatra wants to put a string.
  return (@first + @second).to_s
end

get '/calc/subtract/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first - @second).to_s
end

get '/calc/divide/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first / @second).to_s
end

get '/calc/multiply/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  # Sinatra wants to put a string.
  return (@first * @second).to_s
end

get '/oh_hai/:name' do
  @answer_to_universe = 42
  @name = params[:name]
  erb :hai
end

# example: localhost:4567/10/sum/10
get '/calc/:first/:operation/:second' do
  @first = params[:first].to_f
  #valid operations include : sum, difference, product, quotient
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
    when "sum" then @first + @second
    when "difference" then @first - @second
    when "product" then @first * @second
    when "quotient" then @first / @second
  end
  erb :calc
end