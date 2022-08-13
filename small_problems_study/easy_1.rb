# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:

# repeat('Hello', 3)

# Output:

# Hello
# Hello
# Hello


# def repeat(str, int)
#   int.times do 
#     puts str
#   end 
# end 

# repeat('Hello', 10)







# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# Examples:


# puts is_odd?(2)  == false
# puts is_odd?(5)  == true
# puts is_odd?(-17) == true
# puts is_odd?(-8) == false
# puts is_odd?(0)  == false
# puts is_odd?(7)  == true

# Keep in mind that you're not allowed to use #odd? or #even? in your solution.


# def is_odd?(num)
#   num % 2 != 0 
# end 








# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# Examples:

# puts digit_list(12345) == [1, 2, 3, 4, 5]     == true
# puts digit_list(7) == [7]                     == true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] == true
# puts digit_list(444) == [4, 4, 4]             == true


# def digit_list(num)
#   num.to_s.chars.map { |digit| digit.to_i }   # or num.digits 
# end 




# Write a method that counts the number of occurrences of each element in a given array.

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2


# p: 
# input: array 
# output: string
# rules: count each element in the array 
#       print element => count 
#       each element should be listed only once with corresponding count 
#       words in array are case-sensitive
       
# d:
# input: array 
# intermed: hash 
# output: string 

# a:
# def method to take one param (array)
# initialize empty hash
# iterate through the array
#   save each element as key in hash
#   save count of each element as value in hash 
# print string with keys and values interpolated

# c: 
# def count_occurrences(arr)
#   hash = {}
  
#   arr.each do |element|
#     hash[element] = arr.count(element)
#   end 
  
#   hash.each do |k, v|
#     puts "#{k} => #{v}"
#   end 
# end 

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)







# Write a method that takes one argument, a string, and returns a new string with the words in reverse order. *** Not using reverse.

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''


# p: input: string 
#   output: string (with words in reverse order)
#   rules: string should be returned with words in reverse order 
#           if string has only one word, return string 
#           if string is empty or contains only spaces, return empty string 
#           cannot use reverse method 
#           string should not be mutated 

# d:
# input: string 
# intermed: array 
# output: string 

# a: 
# - def method to take one param
# - split string into array of words 
# - iterate backwards through the array
# - add each word to results array in backward order 
# - join results array
# - return string

# c: 

# def reverse_sentence(string)
#   word_array = string.split 
#   results = []
  
#   (word_array.size - 1).downto(0) do |index|
#     results << word_array[index]
#   end 
  
# results.join(' ')
    
    
# end 





# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.


# P: 
# - input: string (one or more words)
#   output: same string with words that contain 5 or more characters reversed 
#   rules: 
#         - returned string should be input string 
#         - each string only includes letters and spaces 
#         - spaces should be included only when more than one word is present 

# E:
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# D: 
# - input: string (letters and spaces)
# - intermed: array 
# - output: same string 

# A: 
# - split string into array of words 
# - iterate through each word 
#   - check size of word
#     - if greater than or equal to 5
#       - reverse that word 
#     - if less than 5
#       - keep word as is 
# - join array back to string 
# - return string 


# C: 

# def reverse_words(string)
#   words_arr = string.split 
  
#   result = words_arr.map! do |word|
#     if word.size >= 5
#       word.reverse
#     else 
#       word 
#     end 
#   end 
#   result.join(' ')
# end 

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS





# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.


# P:
# -input: integer (positive)
# -output: string (alt 1s and 0s)
# -rules: 
#       - length of string should match given integer
#       - string should always begin with 1
#       - string should alternate 1s and 0s to meet integer size 
#       - 0 should return empty string 
#       - 1, should return '1'

# E:
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# D: 
# - input: integer 
# - intermed: array 
# - output: string

# A: 
# - initialize empty array to push 1s and 0s 
# - count from zero to integer - 1
# - when count is even, push 1 to array
# - when count is odd, push 0 to array 
# - join array 
# - return string 

# def stringy(int)
#   results = []
  
#   int.times do |num|
#     if num.even?
#       results << '1'
#     else 
#       results << '0'
#     end 
#   end 
#   results.join
# end 

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Further Exploration

# Modify stringy so it takes an additional optional argument that defaults to 1. If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.


# def stringy(int, start = 1)
#   results = []
  
#   if start == 1 
#     int.times do |num|
#       if num.even?
#         results << '1'
#       else 
#         results << '0'
#       end
#     end 
#   elsif start == 0 
#     int.times do |num|
#       if num.even?
#         results << '0'
#       else 
#         results << '1'
#       end 
#     end 
#   end 
#   results.join
# end 




# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.


# def average(arr)
#   sum = arr.sum 
#   size = arr.size 
  
#   sum / size 
# end 


# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 







# Write a method that takes one argument, a positive integer, and returns the sum of its digits.


# def sum(int)
#   int.digits.sum
# end 



# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

 
 


# Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.



# def calculate_bonus(salary, bonus)
#   bonus ? salary / 2 : 0
# end 


# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000












