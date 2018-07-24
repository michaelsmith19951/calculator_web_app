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
	math_operation = session[:math_operation]  || ""
	result = session[:result]  || ""
	case math_operation
	when "add"
		math_operation = "+"
	when "subtract"
		math_operation = "-"
	when "multiply"
		math_operation = "*"
	when "divide"
		math_operation = "/"
	end
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	num1 = params[:num1]
	num2 = params[:num2]
	math_operation = params[:math_operation]
	erb :calculator_app_page3, locals:{first_name_input: params[:first_name_input], last_name_input: params[:last_name_input], num1: params[:num1], num2: params[:num2], math_operation: params[:math_operation]}
end
post '/calculator_app_page3' do
	# puts params
	'{"first_name_input"=>"Michael", "last_name_input"=>"Smith", "num1"=>"2", "num2"=>"2", "math_operation"=>"+"}'
	session[:val1] = params[:num1]
	session[:val2] = params[:num2]
	session[:operation] = params[:math_operation]
	puts "before calculate, calculate(#{session[:operation]}, #{params[:num1]}, #{params[:num2]})"
	session[:result] = calculate(session[:operation], params[:num1], params[:num2])
	result = session[:result]
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	num1 = params[:num1]
	num2 = params[:num2]
	math_operation = params[:math_operation].to_s
	puts "in page3 math_operation is #{math_operation} and its class is #{math_operation.class}"
	puts "session[:result] is #{session[:result]}"
	if math_operation == "+"
		math_operation = "plus"
	end
	if math_operation == "/" && num2 == 0
		p "You can't divide by zero! Please enter another number."
		nil
	else
	end
	redirect '/calculator_app_final_page?first_name_input=' + first_name_input + '&last_name_input=' + last_name_input + '&num1=' + num1 + '&num2=' + num2 + '&result=' + result.to_s + '&math_operation=' + math_operation
end
get '/calculator_app_final_page' do
	puts "in calculator_app_final_page params is #{params}"
	puts "in final page result is #{params[:result]}"
	puts "math_operation is #{params[:math_operation]}"
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	num1 = params[:num1]
	num2 = params[:num2]
	math_operation = params[:math_operation]
	if math_operation == 'plus'
		math_operation = '+'
	end
	if math_operation == "/" && num2 == 0
		p "You can't divide by zero! Please enter another number."
		nil
	else
	end
	result = params[:result]
	puts "math_operation is #{math_operation}"
	erb :calculator_app_final_page, locals:{first_name_input: params[:first_name_input], last_name_input: params[:last_name_input], num1: params[:num1], math_operation: math_operation, num2: params[:num2], result:params[:result]}
end
post '/calculator_app_final_page' do
	first_name_input = params[:first_name_input]
	last_name_input = params[:last_name_input]
	num1 = params[:num1]
	math_operation = params[:math_operation]
	num2 = params[:num2]
	result = params[:result]
	session[:solution] = calculator_app_page3(params[:num1], params[:math_operation], params[:num2])
	erb :calculator_app_page3, locals:{first_name_input: params[:first_name_input], last_name_input: params[:last_name_input], solution: session[:solution]}
end
get '/credentials' do
	erb :credentials
end

	# redirect '/calculator_app_page3?first_name_input=' + first_name_input + '&last_name_input=' + last_name_input
# end
