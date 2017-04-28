require 'sinatra/json'
get '/' do
  erb :index
end

get '/question/:question_id' do
#test one
@question = Question.find(5)
  #real one
 # @question = Question.find(params[:question_id])
 @question

 erb :q_aview
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

