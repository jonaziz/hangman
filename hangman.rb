class Hangman
	#This class will be used to run an instantce of a hangman game
	#It is only concerned with one run through of the game
	#It is not responsible for human interaction

attr_accessor :word, :chances, :wboard, :word_arrayed, :guesses, :guess
attr_reader :board, :result_index, :array_word

  	def initialize(word)
   	 	puts "Welcome to our hangman game! Please guess a letter to start"
   	 	puts "-----------------------------------"
 		@word = word.downcase
 		@chances = 8
  		@word_arrayed =[]
  		@wboard = []
  		@guesses = []
  		@result_index = []
  		@guess = ""
  		array_word
  		workingboard
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

	def guess!(letter)
		@guess = letter.downcase
		if guesses.include?(@guess)
			puts "Please enter a different guess,"
		elsif (guess.class == String) && (@guess.length == 1) && (true if guess.match(/[a-z]/) != nil)
			if @word_arrayed.include?(@guess)
				good_guess
			else
				bad_guess
			end
		else
			puts "Please enter one letter."
		end
	end

	def good_guess
		@guesses << @guess
		# compact eliminates "nil"s
		@result_index = @word_arrayed.map.with_index {|letter, index| index if letter == @guess}.compact
		update_board
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

	def won?
		if @wboard == word_arrayed
			return true
		end
	end

	def lost?
		if @chances < 1 
			return true
		end
	end


end