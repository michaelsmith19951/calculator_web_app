require "sinatra"
get '/' do
	erb :calculator_app_page1
end
post '/calculator_app_page1' do
	user_name_input = params[:user_name_input]
	password_input = params[:password_input]
user_name1 = ["michaelsmith19951"]
user_name2 = ["msmith61095"] 
user_name3 = ["mikes1995"]
password1 = ["Mike1995"]
password2 = ["m@ggie123!"] 
password3 = ["bell@123!"]
if user_name_input == "michaelsmith19951" && password_input == "Mike1995"
	redirect '/calculator_app_page2?user_name_input=' + user_name_input + '&password_input=' + password_input
else
	p "Incorrect login. Please try again."

if user_name_input == "msmith61095" && password_input == "m@ggie123"
	p "Login successful!"
else
	p "Incorrect login. Please try again."

if user_name_input == "mikes1995" && password_input == "bell@123!"
	p "Login successful!"
else
	p "Incorrect login. Please try again."
end
end
end
end
get '/calculator_app_page2' do
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	erb :calculator_app_page2, locals:{first_name_input: params[first_name_input], last_name_input: params[:last_name_input]}
end

