require_relative "hangman"

#figure out a random word to use for the game

class HangmanPlay

	def self.word_selector
		wordlist = ["Berlin", "Toronto", "London", "Santiago", "Manhattan", "Yukon", "Edmonton", "Saskatoon", "Saskatchewan", 
 			"Washington", "California", "Cupertino", "Louisiana", "Mississippi", "Mississauga", "Tiguana", "Cancun", "Havana", "Torino", "Ecuador", "Bejing"]  
		@@secretword = wordlist[rand(wordlist.length)]
	end

	#Starts the hangman game
	def self.start
		self.word_selector
		@@game = Hangman.new(@@secretword)
		while !@@game.won? && !@@game.lost?
			self.show_round
		end
		if @@game.won?
			puts "Congratulations, you found out the word is #{@@game.word}"
		else
			puts "Game over. Please play again."
		end
	end

	# print out the first round of the game
	# - Chances
	# - Board
	# - ask for letter
	def self.show_round
		puts ""
		puts ""
		puts "Board: #{@@game.board}"
		puts ""
		puts "Previous Guesses: #{@@game.guesses.join(", ")}"
		puts ""
		puts ""
		puts "Chances: #{@@game.chances}"
		puts ""
		puts "-----------------------------------"
		puts ""
		puts ""
		puts "Enter guess:"
		letter = gets.chomp
		@@game.guess!(letter)
		puts ""
		puts ""
		puts "-----------------------------------"
	end
end
