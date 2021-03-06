require 'sinatra/json'

get '/' do
  @questions = Question.all.order(updated_at: :desc).limit(10)
  erb :index
end

get '/question/:question_id' do
  @question = Question.find(params[:question_id])
  erb :q_aview
end

post '/question/:id/vote' do
  question = Question.find(params[:id])
  dir = params[:direction]
  if dir == 'up'
    question.votes << Vote.create(v_type: "up", user_id: session[:user_id])
  elsif dir == 'down'
    question.votes << Vote.create(v_type: "down", user_id: session[:user_id])
  end

  if request.xhr?
    json count: count_votes(question)
  else
    redirect '/question/#{question.id}'
  end
end





post '/add_com/:answer_id/' do
  user = User.find_by(id: session[:user_id])
  answer = Answer.find_by(id: params[:answer_id])
  comment = Comment.create(body: params[:comment] )
  answer.comments << comment
  if request.xhr?
    json comment: comment.to_json

  else
    redirect "/question/#{answer.question.id}"
  end
end

post '/add_q_com/:question_id/' do
 user = User.find_by(id: session[:user_id])
 question = Question.find_by(id: params[:question_id])
 question.comments << Comment.create(body: params[:comment] )

 if request.xhr?
  user.comments << Comment.create(body: params[:comment], user_id: user.id )
  comment = params[:comment]
  json comment: comment
  else
     #redirect lamely
  end
 end

 post '/add_answer/:question_id/' do
   user = User.find_by(id: session[:user_id])
   question = Question.find_by(id: params[:question_id])
   answer = Answer.create(body: params[:answer], user_id: user.id )
   user.answers << answer
   question.answers << answer
   if request.xhr?
    json answer: answer.to_json

  else
     #redirect lamely
  end
end


post '/answer/:id/vote' do
  answer = Answer.find(params[:id])
  dir = params[:direction]
  if dir == 'up'
    answer.votes << Vote.create(v_type: "up", user_id: session[:user_id])
  elsif dir == 'down'
    answer.votes << Vote.create(v_type: "down", user_id: session[:user_id])
  end
  if request.xhr?
    json votes: count_votes(answer), answer: answer.to_json 
  else
    redirect '/answer/#{answer.id}'
  end
end






