require 'sinatra'
require 'sinatra/reloader'

number = (1 + rand(99)).to_s

get "/" do
	if params["guess"].to_i > number.to_i + 5
		guess = "Way Too High"
	elsif params["guess"].to_i < number.to_i - 5
		guess = "Way Too Low"
	elsif params["guess"].to_i > number.to_i
		guess = "Too High!"
	elsif params["guess"].to_i < number.to_i
		guess = "Too Low"
	else
		guess = "Correct, the secret number was #{number}"
	end
	erb :index, :locals => {:number => number, :guess => guess}
end
