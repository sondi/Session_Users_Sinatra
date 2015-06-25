before '/secret_page' do
	puts "entramos"
	if session[:email] == nil
		redirect to '/'
	end
end

get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

post '/sign_in' do
	name = params[:name]
	email = params[:email]
	password = params[:password]
	user_info = User.new(name: name, email: email, password: password)
	user_info.save
	session[:email] = params[:email]
	redirect to '/secret_page'

end

post '/login' do
	email = params[:email]
	password = params[:password]
	comparison = User.authenticate(email, password)
	if comparison == nil
		redirect '/'
	else
		session[:email] = params[:email]
		redirect '/secret_page'
	end
end

get '/secret_page' do
		erb :secret_page
	
end

post '/logout' do
	session.delete(:email)
	redirect to '/'
end