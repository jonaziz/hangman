class Hangman
	#This class will be used to run an instantce of a hangman game
	#It is only concerned with one run through of the game
	#It is not responsible for human interaction

attr_accessor :word, :chances, :wboard, :word_arrayed, :guesses, :guess
attr_reader :board, :result_index

  	def initialize(word)
   	 	puts "Hangman game!"   
 		@word = word.downcase
 		@chances = 8
  		@word_arrayed =[]
  		@wboard = []
  		@guesses = []
  		@result_index = []
  		@guess = ""
  	end
 
 	def array_word
		@word_arrayed = @word.split("")
		return @word_arrayed
	end

	def workingboard
		@wboard = Array.new(@word.length) {|slot| "_"}
	end

	def board
		return @wboard.join(" ")
	end

	def guess(guess)
		# compact eliminates "nil"s
		@guess = guess
		if guesses.include?(@guess)
			puts "Please enter a different guess."
		elsif guess.class == String && guess.length == 1
			if @word_arrayed.include?(@guess)
				good_guess
			else
				bad_guess
			end
		else
			puts "Please enter a one letter string."
		end
		#@guesses << @guess unless guesses.include?(@guess)
	end

	def good_guess
		@guesses << @guess
		@result_index = @word_arrayed.map.with_index {|letter, index| index if letter == guess}.compact
	end

	def bad_guess
		@guesses << @guess
		@chances -= 1
	end

	def update_board
		@result_index.each do |matchindex|
			@wboard[matchindex] = @guess 	
		end
	end


end