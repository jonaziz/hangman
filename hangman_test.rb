require "test/unit"
require "./hangman"

class HangmanTest < Test::Unit::TestCase
	
	def test_initialize_starts_with_eight_chances
		h = Hangman.new("Toronto")
		assert_equal 8, h.chances
	end

	def test_initialize_has_an_empty_board_of_the_right_size
		h = Hangman.new("Berlin")
		assert_equal "_ _ _ _ _ _ ", h.board
	end

	def test_initialize_accepts_and_uses_the_word
		word = "California"
		h = Hangman.new(word)
		assert_equal word, h.word
		#starts with a word
	end

	def test_initialize_starts_with_no_guesses

	end

	def test_game_ends_when_last_letter_is_guessed_correctly
		word = "Santiago"
		board = "s a n t i a g _"
		h = Hangman.new(word)
		h.board = board
		h.guess 'o'
		assert hangman.won?

	end

	def test_random_word_extraction
		h = Hangman.new
		assert_kind_of String, h.word_extractor
	end

  	def test_word_conversion
  		h = Hangman.new
  		# h.word_extractor
  		# h.array_word
  		assert_equal h.word[0,1], h.word_arrayed[0]
  	end
end

#test_word_length_accuracy

#test_letter_match

#test_position_match
