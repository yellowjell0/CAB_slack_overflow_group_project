require 'sinatra/json'

get '/' do
  @questions = Question.all.order(created_at: :desc)
  erb :index
end

get '/question/:question_id' do
   @question = Question.find(params[:question_id])
   erb :q_aview
end

post '/add_com/:answer_id/' do
  user = User.find_by(id: session[:user_id])
  answer = Answer.find_by(id: params[:answer_id])

  answer.comments << Comment.create(body: params[:comment] )
  # answer.save
  if request.xhr?
    # @user.comments.create(body: params[:comment])
    comment = params[:comment]
    json comment: comment

  else
    #redirect lamely
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
   user.answers << Answer.create(body: params[:answer], user_id: user.id )
   answer = params[:answer]

   question.answers << Answer.create(body: answer , user_id: user.id)
   if request.xhr?

    json answer: answer

  else
     #redirect lamely
   end

 end




