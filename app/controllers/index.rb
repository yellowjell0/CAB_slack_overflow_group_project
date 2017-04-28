get '/' do
  @questions = Question.all.order(created_at: :desc)
  erb :index
end

get '/question/:question_id' do
 @question = Question.find(params[:question_id])
 erb :q_aview
end





