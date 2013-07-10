require 'sinatra'
require 'sinatra/reloader'

number = (1 + rand(99)).to_s
chances = 5
chances_before = 0
get "/" do

	if chances > 0 && chances_before != params["guess"] 
		chances = chances - 1
	elsif chances < 1 
		chances = 8
		number = (rand(99)+1).to_s
	end
		
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
