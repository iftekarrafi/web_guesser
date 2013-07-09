require 'sinatra'
require 'sinatra/reloader'

secret_number = (1 + rand(99))

get "/" do 
	erb :index, :locals => {:number => secret_number}
end