post '/create_question' do
  erb :create_q
end

post '/post_q' do
  Question.create(params)
  redirect '/'
end