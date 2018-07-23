require "sinatra"
require_relative "math_functions.rb"
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
	redirect '/calculator_app_page3?first_name_input=' + first_name_input + '&last_name_input=' + last_name_input
end
get '/calculator_app_page3' do
	val1 = session[:val1] || ""
	val2 = session[:val2] || ""
	operation = session[:operation]  || ""
	result = session[:result]  || ""
	case operation
	when "add"
		operation = "+"
	when "subtract"
		operation = "-"
	when "multiply"
		operation = "*"
	when "divide"
		operation = "/"
	end
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	num1 = params[:num1]
	num2 = params[:num2]
	math_operation = params[:math_operation]
	erb :calculator_app_page3, locals:{first_name_input: params[:first_name_input], last_name_input: params[:last_name_input], num1: params[:num1], num2: params[:num2], math_operation: params[:math_operation]}
end
post '/calculator_app_page3' do
	session[:val1] = params[:num1]
	session[:val2] = params[:num2]
	session[:operation] = params[:math]
	session[:result] = calculate(session[:operation], params[:num1], params[:num2])
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	num1 = params[:num1]
	num2 = params[:num2]
	math_operation = params[:math_operation]
	redirect '/calculator_app_final_page?first_name_input=' + first_name_input + '&last_name_input=' + last_name_input + '&num1=' + num1 + '&num2=' + num2 + '&math_operation=' + math_operation
end
get '/calculator_app_final_page' do
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	num1 = params[:num1]
	num2 = params[:num2]
	math_operation = params[:math_operation]
	result = params[:result]
	erb :calculator_app_final_page, locals:{first_name_input: params[:first_name_input], last_name_input: params[:last_name_input], num1: params[:num1], num2: params[:num2], math_operation: params[:math_operation], result: params[:result]}
end
post '/calculator_app_final_page' do
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	num1 = params[:num1]
	num2 = params[:num2]
	math_operation = params[:math_operation]
	result = params[:result]
	redirect '/calculator_app_page3?first_name_input=' + first_name_input + '&last_name_input=' + last_name_input
end
