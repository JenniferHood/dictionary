require('sinatra')
require('sinatra/reloader')
require('./lib/word.rb')
require('./lib/definition.rb')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/word') do
  @all_words = Word.all()
  erb(:word)
end

get('/words/new') do
  erb(:words_form)
end

post('/words') do
  entered_word = params.fetch('entered_word')
  test_word = Word.new({:entered_word => entered_word})
  test_word.save()
  redirect to('/')
end

get('/reset') do
  Word.clear
  redirect to('/')
end

get('/words/:id') do
  word_id = params.fetch('id')
  @word = Word.find(word_id)
  erb(:word)
end

get('/words/:id/definition/new') do
  word_id = params.fetch('id')
  @word = Word.find(word_id)
  erb(:definitin_form)
end

post('/words/:id/definition') do
  word_id = params.fetch('id')
  word_def = params.fetch('word_def')
  word = Words.find(word_id)
  word.add_definition({:word_def => word_def})
  redirect to('/words')
end
