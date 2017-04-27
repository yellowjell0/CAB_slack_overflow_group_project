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

