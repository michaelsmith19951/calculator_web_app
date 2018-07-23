require "sinatra"
get '/' do
	erb :calculator_app_page1, locals:{error: ""}
end
post '/calculator_app_page1' do
	user_name_input = params[:user_name_input]
	password_input = params[:password_input]
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
user_arr = ["michaelsmith19951", "msmith61095", "mikes1995"]
password_arr = ["Mike1995", "m!ke123!", "ms1995!"]
counter = 0
user_arr.each do |username|
	if username == user_name_input && password_input == password_arr[counter]
		redirect '/calculator_app_page2?'
	end
	counter = counter + 1
end
unless user_arr.include?(user_name_input)
	erb :calculator_app_page1, locals:{error: "The username is incorrect. Please try again."}
end
	erb :calculator_app_page1, locals:{error: "The password is incorrect. Please try again."}
end
get '/calculator_app_page2' do
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	erb :calculator_app_page2, locals:{first_name_input: params[first_name_input], last_name_input: params[:last_name_input]}
end
post '/calculator_app_page2' do
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	erb :calculator_app_page2, locals:{first_name_input: params[first_name_input], last_name_input: params[:last_name_input]}
end

