require_relative "hangman"

#figure out a random word to use for the game

class HangmanPlay

	#Starts the hangman game
	def self.start
		@@game = Hangman.new(#word)
		while !@@game.game_over?
			self.show_round
		end

		p game.word_extractor
		p game.array_word
	end

	# print out the first round of the game
	# - Chances
	# - Board
	# - ask for letter
	def self.show_round
		puts ""
		puts "Your secret word is #{@@game.word}"
		puts "Board: #{@@game.board}"
		puts ""
		puts "Guessed: "
		puts ""
		puts ""
		puts "Chances: #{@@game.chances}"
		puts ""
		puts "Enter guess:"
		letter = gets.chomp
		puts "The letter is: #{letter}"
	end
end
