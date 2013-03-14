require "test/unit"
require_relative "hangman"

class HangmanTest < Test::Unit::TestCase
	
	def test_initialize_starts_with_eight_chances
		h = Hangman.new("Toronto")
		assert_equal 8, h.chances
	end

	def test_initialize_has_an_empty_board_of_the_right_size
		h = Hangman.new("Berlin")
		h.workingboard
		puts h.word
		puts h.wboard

		assert_equal "_ _ _ _ _ _", h.board
	end

	def test_initialize_accepts_and_uses_the_word
		word = "California"
		h = Hangman.new(word)
		assert_equal word.downcase, h.word
		#starts with a word
	end

	def test_initialize_starts_with_no_guesses
		h = Hangman.new("Toronto")
		assert_equal [], h.guesses
	end

	def test_guess_guessing_check
		h = Hangman.new("Berlin")
		h.array_word
		h.guess!("e")

		assert_equal [1], h.result_index
	end

	def test_update_board_with_correct_guess
		h = Hangman.new("yellow")
		h.array_word
		h.workingboard
		h.guess!("l")
		h.result_index

		puts h.wboard.inspect
		assert_equal "_ _ l l _ _", h.board
	end

	def test_update_board_with_repeated_guess
		h = Hangman.new("yellow")
		h.array_word
		h.guesses = ["e"]
		h.workingboard
		h.guess!("e")

		puts h.wboard.inspect
		assert_equal ["e"], h.guesses
	end

	def test_won_when_last_letter_is_guessed_correctly
		h = Hangman.new("Santiago")		
		wboard = ["s", "a", "n", "t", "i", "a", "g", "_"]
		h.guess!('o')

		assert h.won?
	end

	def test_lost_when_last_chance_is_used_incorrectly
		h = Hangman.new("Santiago")		
		wboard = ["s", "a", "_", "t", "i", "a", "g", "_"]
		h.guess!('v')
		
		assert h.won?	
	end

  	def test_word_conversion
  		h = Hangman.new("Berlin")
  		h.array_word
  		assert_equal h.word[0], h.word_arrayed[0]
  	end
end
