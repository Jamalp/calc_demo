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

get '/calc/multiply/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  # Sinatra wants to put a string.
  return (@first * @second).to_s
end

