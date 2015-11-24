get '/anagrams/:word' do
	@word = params[:word]
	@anagrams = Word.find_anagrams(@word)
	erb :show
end

post '/' do
	#@word = params[:word]
	#redirect "/anagrams/#{@word}"
	word = params[:word]
	if valid_input?(word)
		redirect "/anagrams/#{word}"
	else
		@error = "Oops! Enter 3 letters with no repeat letters"
    	erb :index 
	end
end

get '/' do
	erb :index
end

	def three_letters?(input)
    	# return true if input is 3 or less characters
		if input.length <= 3
			true
    	# and false otherwise
		else
			false
		end
	end

	#  check if array has unique letters (no repeating letters)
	def distinct_letters?(input)
   	letter_array = input.chars
   	unique_letters = letter_array.uniq		
		if unique_letters.length < letter_array.length
     		false
   	else
     		true
   	end
	end

	# check if user entered at least 3 unique letters
	def valid_input?(input)
    	if three_letters?(input) && distinct_letters?(input)
      	true
    	else
      	false
    	end
	end
