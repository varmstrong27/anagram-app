# Create a new word page
get '/words/new' do
	@word = Word.new
	erb :"/words/new"
end

# Handle form submission by creating a new word
post '/words' do
	word = Word.create(text: params[:text])
	redirect "/words/#{word.id}"
end

# Handle get request to edit word
get '/words/:id/edit' do
	@word = Word.find(params[:id])
	erb :"/words/edit"
end
 
# Edit word
put '/words/:id' do
	@word = Word.find(params[:id])
	@word.text = params[:text]
	@word.save
	redirect "/words/#{@word.id}"
end

# Show individual word page
get '/words/:id' do
	@word = Word.find(params[:id])
	erb :"/words/show"
end

# Show words landing page to display all words
get '/words' do
	@words = Word.all
	erb :"/words/index"
end

# Delete word
delete '/words/:id' do
	word = Word.find(params[:id])
	word.delete
	redirect "/words"
end
