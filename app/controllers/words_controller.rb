get '/words/:id' do
	@word = Word.find(params[:id])
	erb :"/words/show"
end

get '/words' do
	@words = Word.all
	erb :"/words/index"
end
