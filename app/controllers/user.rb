get '/sign_up' do
  erb :'sign_up'
end

post '/sign_up' do
  User.create(params)
  redirect '/login'
end

get '/login' do
  erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email)
  if User.authenticate(email, password)
    session[:user_id] = user.id
    redirect '/restricted'
  else
    @error = "Invalid login!"
    erb :login
  end
end


get '/logout' do
  session[:user_id] = nil
  erb :index
end


