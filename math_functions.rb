

# Function that performs addition
def addition(first_number, second_number)
# Conditional that prevents entering of strings and arrays
if (first_number == "") || (second_number == "")
	nil
elsif (first_number == []) || (second_number == [])
	nil
else
	answer = first_number + second_number
end

	answer
end

# Function that performs subtraction
def subtraction(first_number, second_number)
	if (first_number == "") || (second_number == "")
	nil
elsif (first_number == []) || (second_number == [])
	nil
else
	answer = first_number - second_number
end
	answer
end

# Function that performs multiplication
def multiplication(first_number, second_number)
		if (first_number == "") || (second_number == "")
	nil
elsif (first_number == []) || (second_number == [])
	nil
else
	answer = first_number * second_number
end
	answer
end

# Function that performs division
def division(first_number, second_number)
# Conditional that removes divide by zero error
if second_number == 0
answer = "You can't divide by zero"
else
if (first_number == "") || (second_number == "")
	nil
elsif (first_number == []) || (second_number == [])
	nil
else
	answer = first_number / second_number
end
end
	answer

end


def calculate(math_operation, num1, num2)
	num1 = num1.to_i
	num2 = num2.to_i
	case math_operation
	when "+"
		return addition(num1, num2)
	when "-"
		return subtraction(num1, num2)
	when "*"
		return multiplication(num1, num2)
	when "/"
		return division(num1, num2)
	end
end

# puts calculate('+', '2', '2') 
