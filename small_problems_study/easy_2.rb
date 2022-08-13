# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

# def teddy_age
#   "Teddy is #{rand(20..200)} years old!"
# end 

# p teddy_age


# Further Exploration

# Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.


# puts "Enter a name:"
# answer = gets.chomp

# name = (answer == "") ? "Teddy" : answer
# age = rand(20..200)

# puts "#{name} is #{age} years old"



# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.


# (1..99).each do |num|
#   puts num if num.odd?
# end 




# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.


# puts 'Please enter number greater than 0:'
# answer = gets.chomp.to_i

# puts "Enter 's' to compute sum, 'p' to compute product"
# operation = gets.chomp

# total = operation == 's' ? ((1..answer).inject(:+)) : ((1..answer).inject(:*))

# puts "Answer is #{total}"