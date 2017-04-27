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
    redirect "/user/#{user.user_name}"
  else
    @error = "Invalid login!"
    erb :login
  end
end

get '/user/:user_name' do
  if session[:user_id] != nil
    @user = User.find_by(id: session[:user_id])
    params[:user_name] = @user.user_name
    erb :'user-profile'
  else
    erb :restricted
  end
end


get '/logout' do
  session[:user_id] = nil
  erb :index
end


