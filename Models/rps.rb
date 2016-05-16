class Game
	def initialize
		@wins = 0
		@loses = 0
		return "Welcome to RPS 2016!"
	end
	def play(choice)
			@choice = choice
			@@options = ["rock","paper","scissors"]
			@computer = @@options.shuffle.first
			case [@choice, @computer]
				when ["paper", "rock"], ["rock", "scissors"], ["scissors", "paper"]
					return "You won"
					@wins = @wins + 1
				when ["paper", "paper"], ["rock", "rock"], ["scissors", "scissors"]
					return "You tied"
				when ["paper", "scissors"], ["scissors", "rock"], ["rock", "paper"] 
					return "You lost"
					@loses = @loses + 1
				end
	end
end


						

		