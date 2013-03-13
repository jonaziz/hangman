class Hangman
	#This c;ass will be used to run an instantce of a hangman game
	#It is only concerned with one run through of the game
	#It is not responsible for human interaction

attr_accessor :wordlist, :word, :board, :chances

  	def initialize()
   	 	puts "Hangman game!"   
 		@word = ""
 		@board = board
 		@chances = 8
 		@wordlist = ["Berlin", "Toronto", "London", "Santiago", "Manhattan", "Yukon", "Edmonton", "Saskatoon", "Saskatchewan", 
 			"Washington", "California", "Cupertino", "Louisiana", "Mississippi", "Mississauga", "Tiguana", "Cancun", "Havana", "Torino", "Ecuador", "Bejing"]  
  		@word_arrayed =[]
  	end
  
	def word_extractor
		@word = @wordlist[rand(@wordlist.length)].downcase
		return @word
	end

	def array_word
		@word_arrayed = @word.split("")
		return @word_arrayed
	end

end