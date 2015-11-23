require_relative 'reverse_letters'

#added below for testing
word = "abc"

def find_anagram(word)

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

#added below for testing
puts "#{find_anagram(word)}"
