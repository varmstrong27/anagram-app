# Show word and its anagrams
get '/anagrams/:word' do
    @word = params[:word]
    alphabetized_string = @word.chars.sort.join
    @anagrams = Word.where("letters=?", alphabetized_string)
    erb :show
end

post '/' do
	word = params[:word]
	begin
		valid_input(word)
		redirect "/anagrams/#{word}"
	rescue Exception => error
		@error = error.message
    	erb :index 
	end
end

get '/' do
	erb :index
end

# check for valid input using exceptions
def valid_input(input)
	if !(input[/[a-zA-Z]+/]  == input)
		raise Exception.new("Word must be alpha letters only.")
	end
end
