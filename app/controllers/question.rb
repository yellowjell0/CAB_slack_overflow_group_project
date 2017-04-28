post '/create_question' do
  erb :create_q
end

post '/post_q' do
  Question.create(params)
  redirect '/'
end

get '/update/:question_id' do
  @question = Question.find(params[:question_id])
  erb :update
end

put '/update/:question_id' do
  question = Question.find(params[:question_id])
  question.update(params[:question])
  redirect '/user/:user_name'
end

get '/delete/:question_id' do
  question = Question.find(params[:question_id])
  question.destroy
  redirect '/user/:user_name'
end

