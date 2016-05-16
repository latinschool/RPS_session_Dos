require 'sinatra'
require_relative 'Models/rps.rb'
enable :sessions

get '/' do
	session[:wins] ||= 0
	session[:loses] ||= 0
	session[:game]= Game.new
	erb :index
end

post '/' do
	game = session[:game] 
	@game = game.play(params[:choice])

	if @game == "You won"
		session[:wins] = session[:wins] + 1
	elsif @game == "You lost"
		session[:loses] = session[:loses] + 1
	end 

	@score = "#{session[:wins]} - #{session[:loses]}"
	
	if session[:wins] == 2
		@end = "You won the round of 3!"
		session[:wins] = 0
		session[:loses] = 0
		erb :gameover
	elsif session[:loses] == 2
		@end = "You lost the round of 3."
		session[:wins] = 0
		session[:loses] = 0
		erb :gameover
	else
		@end = nil	
		erb :results
	end
end

