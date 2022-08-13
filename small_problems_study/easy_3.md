1. Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

P: 
  - asks for 6 numbers from the user.
  - prints message whether or not the 6th number appears among first 5 numbers
  - first 5 integers listed as an array
  -
  -input: 6 numbers
  -output: string 
  -clarification: non-integers, negative nums okay?, format of output

E: 
  - user input == 1, 2, 2, 3, 4, 2
  -   return : "the number 2 appears in [1, 2, 2, 3, 4]"

D: 
  - Array 

A: 
  -prompt user to enter first number
  -save number to array
  -repeat until array contains six numbers 
  -check to see if the 6th number is present in the previous 5 numbers
  - output statement- whether 6th number appears in first 5 numbers
  -   within message, print 6th number, as well as array of first 5 numbers

C: 
```ruby
def prompt(msg)
  puts ">> #{msg}"
end 

numbers = []

prompt("Enter the first number.")
numbers << gets.chomp.to_i

prompt("Enter the second number")
numbers << gets.chomp.to_i

prompt("Enter the third number")
numbers << gets.chomp.to_i

prompt("Enter the fourth number")
numbers << gets.chomp.to_i

prompt("Enter the fifth number")
numbers << gets.chomp.to_i

prompt("Enter the last number")
numbers << gets.chomp.to_i

result = numbers.count(numbers[-1])

present = "The number #{numbers[-1]} appears in #{numbers.take(5)}."

not_present = "The number #{numbers[-1]} does not appear in #{numbers.take(5)}."

puts result > 1 ? present : not_present 
```

2. Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

P: 
  - asking user for two positive integers
  - returning calculated result of +, -, *, /, %, **
  - inputs: two positive integers
  - output: string with calculated result of each operation.
  - clarification: what format should result be in? integers vs floats?

E: 
```ruby 
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
```

D: 

A: 
  - ask user for first integer, save to local var
  - ask user for second integer, save to local var
  - perform each calculation 
  - print integer1 operator integer2 = result 

C: 
```ruby
puts "Enter the first number:"
integer_1 = gets.chomp.to_i 

puts "Enter the second number"
integer_2 = gets.chomp.to_i

puts "#{integer_1} + #{integer_2} = #{integer_1 + integer_2}"
puts "#{integer_1} - #{integer_2} = #{integer_1 - integer_2}"
puts "#{integer_1} * #{integer_2} = #{integer_1 * integer_2}"
puts "#{integer_1} / #{integer_2} = #{integer_1 / integer_2}"
puts "#{integer_1} % #{integer_2} = #{integer_1 % integer_2}"
puts "#{integer_1} ** #{integer_2} = #{integer_1 ** integer_2}"
```
refactor

```ruby
operations = %i(+ - * / % **)
numbers = []

puts "Enter the first number:"
numbers << gets.chomp.to_i 

puts "Enter the second number"
numbers << gets.chomp.to_i

operations.each do |op|
  puts "#{numbers[0]} #{op} #{numbers[1]} = #{numbers.inject(op)}"
end 
```

3. Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

P: 
  - asking user to input word, multiple words..string 
  - count number of characters present, not including spaces
  - return an integer equal to number of characters. 
  - input: word, multiple words..string
  - output: single integer interpolated in string
  - clarification: empty string, return 0?, non-word input 
  - rules: do not include spaces in char count 

E: 
Enter word or phrase.. (user input)
There are x characters in (user input)

D: array

A: 
  - prompt user to input word or multiple words..save to local var
  - split string into individual characters
  - remove spaces 
  - count characters
  - return string interpolated with integer (number of characters)

  get user input and set to local var
  split into char
  join into single string with no spaces 
  split into characters 
  count characters 
  return result 
  
C: 
```ruby
puts "Enter a word or phrase:"
input = gets.chomp

string_no_spaces = input.split.join 

puts string_no_spaces

num_chars = string_no_spaces.chars.count 

puts "There are #{num_chars} characters in '#{input}'. "
```
or
```ruby
puts "Enter a word or phrase:"
input = gets.chomp

num_chars = input.delete(" ").size
puts "There are #{num_chars} characters in #{input}."
```

4. Create a method that takes two arguments, multiplies them together, and returns the result.

```ruby
def multiply(x, y)
  x * y 
end 
```

5. Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

```ruby
def square(num)
  multiply(num, num)
end 
```
Further Exploration

What if we wanted to generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

```ruby
def power_to_the(num, power)
  result = 0
  power.times do 
    result += multiply(num, num)
  end
  result
end 
```
or

```ruby
def power_to_the(num, power)
  multiply(num, 1) ** power
end 
```

6. In this exercise, you will write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.


P: 
  - method takes two arguments
  - return true if exactly one argument is truthy
  - return false otherwise
  - inputs: 2 arguments
  - output: boolean 
  - rules: only one of the operands can return truthy value. 

E: 
```ruby
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false


xor?(16, 16) == false 
xor?(false, true) == true 
```
D: 

A: 
  - define method xor? takes two parameters
  - check each argument to see if returns truthy or falsey value 
  -   return indicator from check..
  -   add indicator to array
  - compare elements of array
  - if only one element of array is `true`..return `true`
  - otherwise return false

C: 
```ruby 
def xor?(param_1, param_2)
  indicators = []
  
  indicators << !!param_1
  indicators << !!param_2
  indicators.count(true) == 1
end 
```
or
 ```ruby
 def xor?(param_1, param_2)
  !!((param_1 && !param_2) || (param2 && !param_1))
end 
```
or 
```ruby
def xor?(bool1, bool2)
 !(bool1 == bool2)
end
```

7. Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. 

The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

P: 
  - given an array 
  - return an array that contains every other element of given array 
  - input: array 
  - output: new array containing every other element
  - clarification: what about nested arrays as elements? new array or mutated?

E: 
```ruby
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
```

D: array

A: 
  - define method `oddities` that takes one parameter (array)
  - iterate through passed in array selecting every other element
  - add selected elements to new array 
  - output new array 

C:
```ruby
def oddities(arr)
  odds = []
  
  arr.each_with_index do |element, index|
    odds << element if index.even? 
  end 
  odds
end 
```
or
```ruby
def oddities(arr)
  odds = []
  for element in arr 
    odds << element if arr.index(element).even?
  end 
  odds
end 
```
or
```ruby
def oddities(arr)
  odds = []
  index = 0 
  
  while index < arr.size
    odds << arr[index] if index.even?
    index += 2
  end 
end
```

8. Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

P: 
  - create method that takes string as argument.
  - return true if string is palindrome, false if not 
  - mindful of case, punctuation, spaces
  - input: string
  - output: boolean
  - clarification: empty string? what would "...." return? 
  - rules: must be palindromatic in regard to char, punctuation, spaces 

E: 
```ruby
palindrome?('racecar') == true
palindrome?('racecar!') == false
palindrome?('Madam') == false
palindrome?('race car') == false
palindrome?('1221') == true 
```
D: string 

A: 
  - define method that takes one parameter (string)
  - check to see if sequence of characters is same forward and backward
  -   string.reverse
  - output boolean result

C: 
```ruby
def palindrome?(str)
  str == str.reverse
end
```

Further Exploration

Write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an `if`, `unless`, or `case` statement or modifier.
 
- can use same method for an array.. another way to do it not using reverse..

for array specifically
```ruby
def palindrome_arr?(arr)
  reversed_arr = []
  index = -1

  loop do 
    reversed_arr << arr[index]
    index -= 1
    break if index == -(arr.size + 1)
  end
  
  reversed_arr == arr
end 
```
takes string or array

```ruby
def palindrome?(input)
  match_result = []
  index = 0
  rev_index = -1 
  
  loop do 
    match_result << (input[index] == input[rev_index])
    break if index == input.size
    index += 1
    rev_index -= 1
  end 
  match_result.all?(true)
end 
```
9. Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters.

P: 
  - method takes one parameter (str)
  - returns true if argument is palindrome
  - case insensitive and ignore all non-alphanumeric chars
  - inputs: string
  - output: boolean
  - rules: ignore non-alphanumeric chars
  - clarification: spaces? count as non-alphanumeric?

E: 
```ruby
real_palindrome?("Madam, I'm Adam") == true
real_palindrome?("Racecar") == true
real_palindrome?("123ab321") == false
```

D: 
  - strings

A: 
  - define method to take one param (str)
  - remove non-alphanumeric characters from str 
  - check if string is same backwards and forwards
  - output boolean (true if palindrome, false if not)

C: 
```ruby
def real_palindrome?(str)
  alpha_num_str = str.delete("^a-z0-9")
  alpha_num_str == alpha_num_str.reverse
end
```
or

```ruby
CHARS = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
         'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
         'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7',
         '8', '9']

def real_palindrome?(str)
  clean_str = '' 
  str.downcase.chars.each { |char| clean_str << char if CHARS.include?(char) }
  clean_str == clean_str.reverse
end
```
10. Write a method that returns true if its integer argument is palindromic, false otherwise.

```ruby
def palindromatic_number?(int)
  int.to_s == int.to_s.reverse
end