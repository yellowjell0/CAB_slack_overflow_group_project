require 'sinatra/json'
get '/' do
  @questions = Question.all.order(updated_at: :desc)
  erb :index
end

get '/question/:question_id' do
  @question = Question.find(params[:question_id])
  erb :q_aview
end

post '/question/:id/vote' do
  question = Question.find(params[:id])
  dir = params[:direction]
  if dir == "up"
  else
  end

  if request.xhr?
    json votes: question.votes.count
  else
    redirect '/question/#{question.id}'
  end
end

post '/add_com/:answer_id/' do
  # params[:answer_id]
   opkidoki = params[:comment]
  # @user = User.find_by(id: session[:user_id])
  # @answer = Answer.find_by(id: params[:answer_id])

  # @answer.comments.create(body: params[:comment] )

  if request.xhr?
    # @user.comments.create(body: params[:comment])
    comment = params[:comment]
    json comment: comment

  else
    #redirect lamely
  end
end




