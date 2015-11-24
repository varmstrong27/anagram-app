class Word < ActiveRecord::Base

	before_create :add_letters

	def add_letters
		characters = self.text.chars
      alphabetized_characters = characters.sort
      self.letters = alphabetized_characters.join
	end

	def self.reverse_letters(letters)
		# create a new array of 2 items
		length = letters.length
		reversed_letters = Array.new(length)
 
		# loop through letters and keep index
		letters.each_with_index do |letter, index|
			# starting at end of original array, letter is is put at end of new array
			reversed_letters[length - index - 1] = letter
		end
 
		reversed_letters
	
	end

	def self.find_anagram(word)

		# create new array without specified length
		anagram = Array.new()

		# split string characters and returns array
		word = word.split("")

		# loop through letters and keep index
		word.each_with_index do |letter, index|
			# create array of letters without current letter
			remaining_letters	= word.select {|ch| ch != letter}	
			#puts "re_le: #{remaining_letters}"
			# add current letter before rest of reamaining letters
			anagram.push(letter + remaining_letters.join)
			#puts "an1: #{anagram}"
			# add current letter and reversed remaining letters
			anagram.push(letter + reverse_letters(remaining_letters).join)
			#puts "an2: #{anagram}"
		end

		anagram

	end
 
  def self.find_anagrams(string)
    # Convert word to an array of letters
    letters = string.split(//)
 
    # Create arrays to store potential and actual anagrams
	 combinations = []
    anagrams = []
 
    # Loop through each letter in letters
    letters.each do |letter|
      # Select the remaining letters
      remaining = letters.select { |l| l != letter }
 
      # Create a new word by combining the letter + the remaining letters
      # Add new word to combinations array
      combinations << letter + remaining.join('')
 
      # Create a new word by combining the letter + the reverse of the remaining letters
      # Add new word to combinations array
      combinations << letter + reverse_letters(remaining).join('')
    end

	# Loop through potential anagram array to check if word exists in dictionary
	combinations.each do |combo|
	 # If word exists in dictionar, add word to actual anagram array
    if Word.find_by_text(combo).present?
      anagrams << combo
    end
  end
 
    # Return anagrams array
    anagrams
  end
 
  def self.reverse_letters(letters)
    # create a new array of 2 items
    length = letters.length
    reversed_letters = Array.new(length)
 
    # loop through letters and keep index
    letters.each_with_index do |letter, index|
      reversed_letters[length - index - 1] = letter
    end
 
    reversed_letters
  end
end
