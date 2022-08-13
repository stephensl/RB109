=begin

In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.


letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

p:
- given a string, count lowercase lettters in string and return as a hash, wish key being the lowercase letter as a symbol and value being the count of that character in string. 

- input: string 
- output: hash (k: lowercase letter as symbol, value as count of that char)
- rules: 
        - only lowercase letters should be counted 
        - key should be a symbol
        - value is integer equal to number of occurences of that key in string
        - empty string should return empty hash
- question: 
          - what if string of spaces? (will assume this is empty string and return empty hash.
          
e:
letter_count('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

d:
- input is string
- output is hash

a:
- define method to take one parameter (string)
- initialize empty hash
- break string into array of characters
- iterate through each character
- if char is alphabetic, and lowercase
  - transform character to symbol
  - add symbol as key in hash
  - assign value to key equal to the count of that character in input string
- repeat previous step for each character in array
- return hash 



def letter_count(str)
  char_count_hash = {}
  char_array = str.chars 
  
  char_array.each do |char|
    if ('a'..'z').include?(char)
      char_count_hash[char.to_sym] = char_array.count(char)
    end
  end 
  
  char_count_hash
end

=end

=begin

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0

If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)

Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

Examples: 

[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)


p:
- given array of integers, return the count of all pairs of two of the same integer. 
- input: array of integers (0..1000)
- output: single integer (count of all pairs of same integer)
- rules: 
        - pair means the integer is present twice in the array 
        - if more than two pairs of same integer, count twice 
        - if array is empty return 0 
        - if array contains only one integer, return 0 

e:
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

d:
- input: array of integers
- intermed: 
- output: single integer

a:
- general: 
  - sort array based on integer value (least to greatest)
  - check if first two integers are equal 
    - if so, increment pair count by 1
    - remove those two elements from array 
      - if not equal
      - do not increment counter
      - remove first element from array 
  - check next two elements
  - repeat
  

- define method to take one parameter (array)
- initialize pair_counter to 0 
- sort integers in array least to greatest
- iterate through array of integers 
- compare first element to second element
  - if equal, increment counter + 1
  - remove two elements from array 
    - if not equal, do not increment counter
    - remove first element from array 
- compare next two integers
- repeat until array contains only one element or array.empty?
- return count



def pairs(array)
  
  if array.size == 1 || array.empty?
    return 0
  end 
  
  pair_counter = 0 

  sorted_array = array.sort 
  
  loop do 
    if sorted_array[0] == sorted_array[1]
      pair_counter += 1
      sorted_array.shift(2)
    else 
      sorted_array.shift
    end 
    
    break if sorted_array.size == 1 || sorted_array.empty?
  end 
  
  pair_counter
  p array
end 
  
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0  

=end
  

=begin

Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

p:
- given a string, and a substring, determine number of times the substring is present in the string. 
- input: string, and substring
- output: single integer (number of times substring is present in string)
- rules: 
        - complete substring must be present to be counted
        - substring must appear in same sequence within string to be counted
        - if substring not present in string, return 0
        - if string or substring is empty, return 0 
        - substring is case sensitive. must match entirely

e:
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

d:
- input: two strings (string and potential substring)
- output: integer (number of times substring is present in string)

a:
- general:
  - find all sequential substrings in string equal to substring length
  - iterate through substrings
  - check if each substring is present in string 
  - if present, push to array
  - after iterated through and checked all substrings
  - check array size of matching substrings 
  - return array size 
  
  

def solution(string, substring)
  substr_arr = []

  0.upto(string.length - 1) do |index|
    substr_arr << string[index, substring.size]
  end 
  
  substr_arr.count(substring)
end 

refactored... using String#scan

def solution(string, substring)
  string.scan(substring).size
end


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

p solution('ccddeeccddeecc', 'cc') == 3

=end



# [1, 2, 3]
# arr = [1, 1, 1]

# p arr.all?(arr[0])

=begin

Given a string of digits and returns a string representing the 
highest integer made with 3 of the same consecutive integers. 

Rules: 
- return an empty string if no 3 con identical digits


examples: 

555 is greater than 222
largest_good_integer('13455587222') == "555"

no 3 consecutive identical digits so empty string 
largest_good_integer('456987') == ""

000 only 3 consecutive
largest_good_integer("11458000") == "000"

111 only 3 consecutive 
largest_good_integer("111") == "111"

666 highest value 
largest_good_integer("111222333444555666") == "666"

no 3 consectuive 
largest_good_integer("42352338") == "" 

Data structures: 

'13455587222'

'134' 345 455 555 find all substrings length of 3 

'555' select substrings that have all the same numbers 
    [5, 5, 5] iterate through with index 
              compare number at index 0 w/ rest of numbers 
    
555 change to Integer

555 return max change to string 

Algo: 

- find the substrings for the given string w/ length of 3 (helper method)

- iterate through substrings and select the string with all same numbers
  - iterate through each string, change to array of string digits
  - iterate through string digits w/ index 
    - comparte index 0 with other indices 

- iterate through array of substrings and change to integers 
  - change string to chars
    - change char to Int

return max from array of integers 

=end 

# p isAValidMessage("1a2bb3ccc4dddd5eeeee") == true
# p isAValidMessage("") == true


# p:
# - given string of letters and numbers 
# - return true if after each number there is a substring equal to that number in length
# -input: string (mix of letters and number)
# - output: boolean 
# - rules:
#         - when a number appears in the string, letters immediately following the number must equal number in length
#         - if empty string return true 
#         - onlty letters and numbers in the string 

# d:
# input: string 
# intermed: array of characters  ['1a3bbb'] [1, 3] [a, b, b, c]
# output: true or false

# "3hey5hello2hi"

# [3, 5, 2]
# [hey, hello, hi]



# a:
# - iterate through string char by char 
# - check if char is a letter
#   - push letters to storage string
#   - if not, push to numbers array
#     push storage string to letter_arr 
#     storage = ''
#   - iterate through number array 
#     - compare element.to_i == letter_array[index].size
#     if true, continue iteration
#     else return false 
#       return true 

# =end


# def isAValidMessage(string)
#   numbers = []
#   letters = []
#   storage = ''

#   return true if string.empty? 
    

#   string.each_char do |char|
#     if ('a'..'z').include?(char)
#       storage << char
#     else 
#       numbers << char
#       letters << storage unless storage == ''
#       storage = ''
#     end 
#   end

#   letters << storage if !storage.empty?

#   numbers.each_with_index do |num, index|
#     if num.to_i != letters[index].size
#       return false
#     end
#   end 
#   true 
# end  

# arr = [1, 2, 3]
# arr.index(-1)






# algorithm: 

# - initialize a results Array
# - iterate through one array 
#   - check if the current number is present in the other Array
#     - if it is pass it into results unless the count of the current number in result is greater than the count of the current number in the current array. 
# =end 

=begin
Create a method that takes two lists of numbers sorted in ascending order and returns an array of numbers which are common to both the input arrays.


input: two arrays 
output: an array 

rules: 

- method returns an array containing the numbers which are common in both arrays. 
- the output is sorted in descending order. 

- all the elements in the input array are integers (positive and negative)

- return an emtpy array if no if there ano common numbers in both arrays. 
- the size of the two arrays is different. 

data structures: 
[1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5] -> [7, 4, 3, 1]


Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.


p;

given an array of strings. return array of integers. 
integers in the array indicate how many letters from each word in the input array occupt their correct position alphabetically. 
input: array of strings
output: array of integers
rules: 
      - for each string in the input array- count letter if it occupies the same position in the string that it occupies in the alphabet
      - input string is case insensitive 
      - input contains alphabetic chars, upper and lowercase without spaces 
      - returned array will contain same number of elements as input array
        - integer for each string
      
data:
input; array
intermed: array of alpha chars 
output; array

[a b c d e .. ]
[a b o d e]

a; 
- init: alphabet array
- init: results array 
- iterate through input array
  -init count variable
  - break each string in input array to chars 
  - iterate through each char by index
  - check if char.downcase is equal to char in alpha array at same index
  - if same char, increment count by 1
  - continue through chars
  - push count to results 
- change count back to 0
- iterate through next word
stop after iterated through each word

=end

# def solve(array)
#   alpha = ('a'..'z').to_a
#   results = []
  
#   array.each do |word|
#     count = 0 
#     word.chars.each_with_index do |char, index|
#       count += 1 if char.downcase == alpha[index]
#     end
#     results << count
#   end 
#   results
# end 
      
# p solve(["abode","ABc","xyzD"]) == [4,3,1]


=begin
# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.



p;
input: array of (n) positive integers and positive integer (s)
output: integer
rules: 
  - output should be minimum length of integers in sub array of which the sum is greater than or equal to the given integer (s)
  - integers in subarray must be sequential
  - if none exist, return 0
  
e:
# p minSubLength([2,3,1,2,4,3], 7) == 2    (4 and 3)
# p minSubLength([1, 10, 5, 2, 7], 9) == 1    (10)
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4 (100, 1, 0 , 200)
# p minSubLength([1, 2, 4], 8) == 0  (none greater than 8)


d:
- input: array of integers, and single integer
- intermed: sub arrays of integers
- output: single integer >= 0

a:

- general: 
  - create subarrays of contiguous integers 
  - sum sub arrays
  - check if sum of sub arrays >= given integer (s)
  - return size of smallest sub array that meets requirement

- def method to take two parameters
- initialize empty array to accept subarrays 
- create sub arrays of sequential integers 
- select subarrays in which sum is greater than or equal to given integer (s)
- check size of each qualifying subarray
  - return size of smallest 
  
=end

# def minSubLength(array, integer)
  
#   sub_arrays = find_sub_arrays(array)
  
#   qualifying_subs = sub_arrays.select do |subarr|
#     subarr.sum >= integer
#   end 
  
#   return 0 if qualifying_subs.empty? 
  
#   sub_arr_sizes = qualifying_subs.map do |subarray|
#     subarray.size
#   end 
  
#   sub_arr_sizes.min
# end 

# def find_sub_arrays(array)
#   subarrays = []
#   0.upto(array.size - 1) do |start_index|
#     start_index.upto(array.size - 1) do |end_index|
#       subarrays << array[start_index..end_index]
#     end
#   end 
#   subarrays
# end 

    
# p minSubLength([2,3,1,2,4,3], 7) == 2    
# p minSubLength([1, 10, 5, 2, 7], 9) == 1  
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4 
# p minSubLength([1, 2, 4], 8) == 0  









# You are given an array which contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

# You can asume there is never an empty array and there will always be an integer.

# p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]


# - given an array of positive and/or negative integers. sum only the integers that are the same, and consecutive. 

# input: array of integers- positive or negative 
# -output: array of integers (num, or sum of consecitive equal integers)
# - rules: given array contains only positive of negative integers
#         - no array will be empty
#         - return array will be each element of given array with consecutive duplicates collapsed into sum of those duplicates. 


# def sum_consecutives(arr)
#   sliced = arr.slice_when do |a, b|
#     a != b 
#   end 
#   sliced_array = sliced.to_a

#   result = sliced_array.map do |subarray|
#     subarray.sum 
#   end 
  
#   result.flatten
# end 

# p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
# require 'pry'
# def valid?(message)
#   chars = message.chars
#   alphabet_range = ('a'..'z')

#   if alphabet_range.include?(chars[0])
#     return false
#   end 

#   grouped_num_letters = chars.slice_when do |a, b|
#     !(alphabet_range.include?(b))
#   end 
  
#   grouped_array = grouped_num_letters.to_a
#   p grouped_array
  
#   results = grouped_array.map do |subarray|
#     subarray[1..-1].size == subarray[0].to_i
#   end 
  
#   results.all?(true)
# end

# valid?("3hey5hello2hi") 
# p valid?("4code13hellocodewars") == true
# p valid?("3hey5hello2hi5") == false
# p valid?("code4hello5") == false
# p valid?("1a2bb3ccc4dddd5eeeee") == true
# p valid?("") == true



=begin
In this kata, you have an input string and you should check whether it is a valid message. To decide that, you need to split the string by the numbers, and then compare the numbers with the number of characters in the following substring.

For example "3hey5hello2hi" should be split into 3, hey, 5, hello, 2, hi and the function should return true, because "hey" is 3 characters, "hello" is 5, and "hi" is 2; as the numbers and the character counts match, the result is true.

Notes:

Messages are composed of only letters and digits
Numbers may have multiple digits: e.g. "4code13hellocodewars" is a valid message
Every number must match the number of character in the following substring, otherwise the message is invalid: e.g. "hello5" and "2hi2" are invalid
If the message is an empty string, you should return true

p (valid?("3hey5hello2hi") == true
p (valid?("4code13hellocodewars") == true
p (valid?("3hey5hello2hi5") == false
p (valid?("code4hello5") == false
p (valid?("1a2bb3ccc4dddd5eeeee") == true
p (valid?("") == true






# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".


p:
given a string, return string with every 2nd character in every third word capitalized

input: string 
output: string (every second character in every third word, uppercased)
rules: first target word is at index 2
       - if string is less than 3 words in size, return string as is 
       - if greater or equal to 3 in size, transform that word
       - empty string return empty string 
      - if second char in third word is already uppcased, leave as upcase
      

d: 
- string --> array ---> string 

a: 
iterate through the input string 
  - split string into an array of words
  - start iteration at word at index 2
select every third word 
  - first selected word will be at index 2 of array
  iterate through characters of selected string 
    - first char to upcase will be char at index 2 of the word 
  change every other char to upcase 
return the string 

=end





# to_weird_case('Lorem Ipsum is simply dummy text of the printing')
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'





# n = 12345

# def descending_order(n)
#   n.digits.sort {|a, b| b <=> a }.join.to_i
# end

# p descending_order(n)


# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.

# Whitespace and punctuation shall simply be removed!

# The input is restricted to contain no numerals and only words containing the english alphabet letters.

# p alphabetized("The Holy Bible") == "BbeehHilloTy"
# p alphabetized("!@$%^&*()_+=-`,") == ""
# p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

=begin

p:
- input: string 
- output: string 
- rules:
        - returned string will be a new string 
        - returned string will be in alphabetical order based on appearance in input
        - case does not matter in ordering characters for returned string
        - whitespace and punctuation should be removed 
        - input will contain only alphabetic letters 
        
e: 
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

d:
 Begin with a string, perhaps utilize array to order characters in the string, and return a new string. 
 
 a:
 - break string into array of characters
 - iterate through characters array
  - remove non alphabetic characters from the array 
 - sort the remaining characters in alphabetical order (a-z) (case insensitively)
 - convert the character array back to a string 
 - return the string 
 
 #input:string
#output:string

#problem:
#  Re-order all the letters in the given string alphabetically case insensitive.


#algorithm
#  remove all white space and non alphabetical characters from the string
#  change the string into an array of characters
#  sort the array into
########################## Lawton Kendrick ################################

# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"


#input:string
#output:string

#problem:
#  Re-order all the letters in the given string alphabetically case insensitive.


#algorithm
#  remove all white space and non alphabetical characters from the string
#  change the string into an array of characters
#  sort the array into




def alphabetized(str)
  alphabetic_chars = str.chars.select do |char|
    ('a'..'z').include?(char.downcase)
  end 
  p alphabetic_chars
  sorted_array = alphabetic_chars.sort { |a, b| a.downcase <=> b.downcase }
  sorted_array.join
end 

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
=end


=begin
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.


p:
- input: array of strings
- output: array of integers
- rules: 
        - counting number of chars in each string within input array that are positioned as they are in the alphabet 
        - words will be made up of uppercase and lowercase alphabetic letters 
        - each word will be a string element in the input array
        - return array will be same size as input array
        - if no characters occupy position in string == position in alphabet return 0 for that string in returned array 
        - case does not matter
        - empty strings should return 0 
        - empty array return empty array

e:
solve(["abode","ABc","xyzD"]) == [4,3,1])
solve(["abide","ABc","xyz"]) == [4,3,0])
solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7])
solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3])

d: 


a: 
- initialize alphabet array a..z 
- initialize results array []
- iterate through the array to access each string (word)
 -initialize counter = 0 
  - iterate through the characters of the string by index
   
    - for each character (downcased), check if index location of char in string == index location in alphabet array. 
      - if it is equal, increment counter 
      - if not equal, continue iteration through characters 
      - once reach end of the word's characters
        - push count to results array 
  - ensure that counter gets reset to 0 for next word. 
  - repeat iteration until end of array 
  - return results array 

require 'pry'

def solve(array)
  alphabet_array = ('a'..'z').to_a
  results = []
  
  array.each do |word|
    counter = 0 
    word.chars.each_with_index do |char, index|
      counter += 1 if index == alphabet_array.index(char.downcase)
    end 
    results << counter
  end 
  results
end 

      
       
p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
=end 


=begin

The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

p: given lowercase string, return length of longest substring consisting only of vowels.
-input: string
- output: integer
- rules: 
  - given lowercase string with only alphabetic chars
  - string will include both vowels and consonants
  - string will not include spaces
  - return the longest substring consisting of only vowels 
  - empty string, return 0 
  - vowels are a, e, i , o , u


e:
# p solve("codewarriors") == 2
# p solve("suoidea") == 3
# p solve("iuuvgheaae"),4)
# p solve("ultrarevolutionariees" == 3
# p solve("strengthlessnesses") == 1
# p solve("cuboideonavicuare") == 2
# p solve("chrononhotonthuooaos") == 5
# p solve("iiihoovaeaaaoougjyaw") == 8

d:
input: string 
intermed: arrays
output: integer 

a: 
- initialize vowels constant 
- retrieve all possible substrings size 1, up to size of string
  - iterate through string starting with first char
  - increntally increase substring length from start char
  - once all substrings have been formed from start char, increment to next start char
  - do this for each character in the string 
- select substrings from all substrings that contain only vowels 
  - iterate through substrings
  - check to see if all characters are vowels using constant vowels
  - save vowel only substrings to local variable
- check the size of each vowel only substring 
  - iterate through vowel only substrings
  - check size of each substring
  - return largest size
- return integer which is the largest size vowel only substring



def solve(string)
  vowels = 'aeiou'
  
  substrings = get_substrings(string)
  
  vowel_substrings = substrings.select do |substr|
    substr.chars.all? { |char| vowels.include?(char) }
  end 
  
  vowel_substrings.max { |a, b| a.size <=> b.size }.size
end 


def get_substrings(str)
  substrings = []
  
  0.upto(str.length - 1) do |start_index|
    start_index.upto(str.length - 1) do |end_index|
      substrings << str[start_index..end_index]
    end 
  end 
  substrings
end 
      


p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
=end

=begin 

Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.

p: 
- input: string of integers
- output: integer 
- rules: 
        - return the number of substrings that can be created and whose integer value is odd
        - if all even numbers return 0 
        - if empty string, return 0 

E: 

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

d:
- input: string 
- intermed: array to store substrings
            - convert strings to integers to check if odd 
= output: single integer >= 0

a: 

- create all substrings 
  - assign start char range in substring
  - assign ending char range in substring
  - iterate through substring with first char as starting char 
    - increment end index unti reach end of substring from start index
    - increment start index and repeat. 
    
  - 
- filter out, non-odd substrings 
  - iterate through array of substrings
  - check to see if substring converted to integer is odd?
    - if odd.. push to odds array 
    - if not continue iteration
  - return size of odd integer array 
  
  


def solve(string)
  substrings = get_substrings(string)
  odd_substrings = []
  
  substrings.each do |str|
    odd_substrings << str if str.to_i.odd?
  end 
  
  odd_substrings.size 
end 

def get_substrings(str)
  substrings = []
  0.upto(str.length - 1) do |start_index|
    start_index.upto(str.length - 1) do |end_index|
      substrings << str[start_index..end_index]
    end 
  end 
  substrings
end 

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
=end

=begin
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.


p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No','No']) == 'No'
p nth_char(['Chad','Morocco','India','Algeria','Botswana','Bahamas','Ecuador','Micronesia'] == 'Codewars'


p: 
input: string
output: string
rules: 
      - select the letter at incrementing indexes for each word in the array 
      - if index of word is zero, select char at index zero if that word
      - if index of word is one, select char at index one of that word...
      - return string will be concatenated letters from each word 
      - empty array returns empty string 
      - each word will have sufficient letters based on index
      
e: 
p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No','No']) == 'No'
p nth_char(['Chad','Morocco','India','Algeria','Botswana','Bahamas','Ecuador','Micronesia'] == 'Codewars'


d: input: string 
    intermed: array to push characters 
    output: string
    
    
a;

- iterate through the array of words by index
- for each word, iterate through characters of that word
- choose the character at current index 
- push char to results array 
- continue to next word..repeat
- join results array 
- return result string 

c: 


def nth_char(array)
  selected_chars = []
  
  array.each_with_index do |word, index|
    selected_chars << word[index]
  end 
  
  selected_chars.join
end 
    
p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No','No']) == 'No'
p nth_char(['Chad','Morocco','India','Algeria','Botswana','Bahamas','Ecuador','Micronesia']) == 'Codewars'

=end

=begin
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times.

The input string consists of lowercase latin letters.

Your function should return :


an array [t, k] (in Ruby and JavaScript)

Example #1:

for string

s = "ababab";
the answer is

("ab", 3)
Example #2:

for string

s = "abcde"
the answer is

("abcde", 1)
because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

f("abcde") == ["abcde", 1]
f("ababab") ==  ["ab", 3]


P:
input: string
output: array [substring, integer]
rules: - finding smallest possible substring that can be repeated to create            the input string 
      - if no substring exists that can be repeated more than one time.. return array of full string, and number 1
      -minimum substring * k == string 
      
E: 
f("abcde") == ["abcde", 1]
f("ababab") ==  ["ab", 3]

d:
input: string
intermed: arrays
output: array 

a: 
- find all leading substrings that are less than or equal to half of the input string
- iterate through substrings
  - check if substring can be repeated to form input string
  - if yes, 
    - push substring to possibilities array 
  - if not, continue iteration
- if none of the substrings can be repeated to form the input string  
  - return array [input string, 1]
- find smallest substring in possibles array 
- determine how many times substirng must be repeated to generate string
  - string size / substring size == multiplier
  - return array with substring and multiplier as elements
  
c:


def f(string)
  substrings = find_substrings(string)
  target_substrings = get_repeatable_substrings(string, substrings)
  
  if target_substrings.empty?
    return [string, 1]
  end 
  
  winning_substring = target_substrings.min { |a, b| a.size <=> b.size }

  multiplier = string.size / winning_substring.size 
  
  return [winning_substring, multiplier]
  
end 

def find_substrings(str)
  substrings = []
  0.upto((str.length / 2) - 1) do |index|
    substrings << str[0..index]
  end 
 substrings
end 


def get_repeatable_substrings(str, arr)
  arr.select do |substring|
    multiplier = str.size / substring.size
    substring * multiplier == str
  end 
end 
  

p f("abcde") == ["abcde", 1]
p f("ababab") ==  ["ab", 3]
  
=end

=begin

Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner
letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the
letters.
Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.
In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours
will be sorted alphabetically


Requirement
return a string where:
1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't
Assumptions
1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation
for reference: http://en.wikipedia.org/wiki/Typoglycemia



P:
given a string, sort every character in the string in alphabetical order aside from the first and last character. 

- input: string
- output: string
- rules: first and last characters of string should not be moved
        - punctuation should not move in the string
        - case insensitive 
        - all letters between first and last should be sorted alphabetically
        - if one letter long, return that character
        - if empty string return empty string
- questions;
  - what if contains multiple words

e: 
p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'


d; 
input: string
- array to sort characters
- output: string

a: 
- iterate from second character to second to last character of string
- if current char is alphabetic, sort it, if not leave it
- continue iteration until reach second to last character
- return sorted string
- 
=end



=begin

In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

More examples in the test cases.

Good luck!

p solve(123056,1) == '12056
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'

P;
input: two integers
output: string of numbers 
rules: 
      - remove 'k' digits from the number
      - return lowest possible number with k digits removed
      - order must be maintained after digits removed
      - return value should be in form of string of digits

e: 
p solve(123056,1) == '12056
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'

d: 
input: integers
intermed: array 
output: string

a: 
- convert integer n to string
- create substrings of numbers that are n - k in length 
- convert substrings to integers and add to array 
- find minimum value in array and return as string

c: 

=end

# def solve(integer, num_to_remove)
#   string_number = integer.to_s
#   substring_length = string_number.length - num_to_remove
#   substrings = []
  
#   string_number.chars.combination(substring_length) do |combo|
#     substrings << combo
#   end 
#   substrings.map(&:join).min
  
  
# end 



# p solve(123056,1) == '12056'
# p solve(123056,2) == '1056'
# p solve(123056,3) == '056'
# p solve(123056,4) == '05'
# p solve(1284569,1) == '124569'
# p solve(1284569,2) == '12456'
# p solve(1284569,3) == '1245'
# p solve(1284569,4) == '124'
  




=begin
A collection of spelling blocks has two letters per block, as shown in this list:

Copy Code
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M
This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples:

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true


P; 
input: string
- output- boolean
- rules: 
        - each block can only be used once to spell the input string
        - each block must use only one letter present on given block in word 
        - if word can be spelled using only unique blocks, return true
        - if word needs block to be used more than once to be spelled, return false
        
e: 
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

d: 
input: string
intermed: hash
- output: boolean

a: 
- create hash of block k, v pairs
- iterate through string characters 
- check to see if char is a key in the hash
  - if so, delete the key/value pair
  - move on to next char
- check to see if char is a value in the hash
  - if so, delete the key value pair 
  - move on to next char
- if char is not a key or value present in the hash
  - return false 
- after iterating through whole string
- return true 

c:
=end


# def block_word?(str)

#   hash = { 'b' => 'o', 'x' => 'k', 'd' => 'q', 'c' => 'p', 'n' => 'a', 'g' => 't', 'r' => 'e', 'f' => 's', 'j' => 'w', 'h' => 'u', 'v' => 'i', 'l' => 'y', 'z' => 'm' }
  
#   str = str.downcase
  
#   str.each_char do |char|
#     if hash.has_key?(char)
#       hash.delete(char)
#     elsif hash.has_value?(char)
#       hash.delete(hash.key(char))
#     else 
#       return false 
#     end 
#   end 
#   true
# end 
    
# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true


=begin
Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a
hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of
the array, and as values the counting of each value.
Example usage:
input = [1,1,2,2,2,3]
group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:
Array#count
Array#length
=end

=begin

P; 
input: array 
output: hash 
rules: 
  - returned hash contains each integer in the array as key
  - returned hash contains the count of each integer as value to corresponding key
  - empty arrays or nil should return nil
  - cannot use count or length in solution

e:
p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}

d:
- array 
- hash

a: 
- intitialize empty hash 
- iterate over array 
  - check to see if integer exists as key in hash
    - if not, add integer as a key
    - set value to 1
    - move to next integer in array 
  - if integer does exist in hash
    - increment the value +1 of that key
    - move to next integer
- once iteration is complete
- return hash 

C;
=end

# def group_and_count(array)
#   if  array == nil || array.empty? 
#     return nil 
#   end 
  
#   hash = {}
  
#   array.each do |integer|
#     if hash.has_key?(integer)
#       hash[integer] += 1
#     else 
#       hash[integer] = 1
#     end 
#   end 
#   hash 
# end 
  

# p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
# p group_and_count([]) == nil
# p group_and_count(nil) == nil
# p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}






=begin
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string
and you must return that string in an array where an uppercase letter is a person standing up.
Rules
1. The input string will always be lower case but maybe empty.
2. If the character in the string is whitespace then pass over it as if it was an empty seat.


p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs",
"codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs",
"two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]


P: 
-input: string
- output: array 
- rules: 
      - string will always be lowercase or empty
      - ignore whitespace 
      - return array of repeated strings
        - each element in the array is the input string with one letter capitalized
        - the first element in the array should have first letter capitalized
        - the second element should have second letter capitalized ... 
e: 
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs",
"codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs",
"two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

d: 
- input: string
- intermed: arrays
- output: array 

a: 
- split the string into characters
- set outer index = 0 
- check char at index 
  - if char is alphabetic 
  - capitalize it
  - add joined word to array 
  increment index +1
  - if non alphabetic continue iteration without incementing index 

=end

# def wave(str)
#   results = []
  
#   index = 0 
#   loop do 
#     str_chars = str.chars
#     if ('a'..'z').to_a.include?(str_chars[index])
#       str_chars[index].upcase!
#       results << str_chars.join
#       index += 1
#     else 
#       index += 1
#     break if index >= str.chars.size 
#     end 
#   end
#   results
# end 

# p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs",
# "codewarS"]
# p wave("") == []
# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs",
# "two wordS"]
# p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

# def wave(str)
#   result = []
#   chars = str.downcase.chars
#   chars.each_with_index do |char, idx|
#     next if char == " "
#     result << str[0...idx] + char.upcase + str[idx+1..-1]
#   end
#   result
# end





=begin

Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b
are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet,
which are positions 4 and 5.
Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each
word. For example,
solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.
Input will consist of alphabet characters, both uppercase and lowercase. No spaces.
Good luck!

Last digit symmetry
Alternate capitalization
=end
=begin
input: Array of Strings (words)
return: Array of Integers (counts for each word in argument)
goal: determine how many letters in each word of the argument are in alphabetical position
rules:
  case-insensitive
  alphabetical order starts with a = 1, b = 2... z = 26
  argument's words consist of only letters (no whitespaces)

{'a'=>1, 'b'=>2...}
['a', 'b'...] index
 0      1
  "abide" => ["a", "b", "i", "d", "e"] => 'a', 0 == 0 => count += 1 => 'b', 1 == 1 count += 1 => 'i', 2 => false


algorithm:
  initialize a master list: all the letters of the alphabet, in order
  iterate through the argument's words and create a new Array
    iterate through the word's letters upcased with index and select
      compare the index of the current letter with the letter's index in the master list
        if indices are the same
          select letter
    count the number of selected letters in the word
=end

# ALPHABET = ('A'..'Z').to_a

# def solve(arr)
#   arr.map do |word|
#     word.upcase.chars.select.with_index do |letter, idx|
#       idx == ALPHABET.index(letter)
#     end.size
#   end
# end

# p solve(["abode","ABc","xyzD"]) == [4,3,1]
# p solve(["abide","ABc","xyz"]) == [4,3,0]
# p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
# p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]


=begin

In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key
and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.
Example:
letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})

p: 
-input: string
- output: hash 
- goal: create hash in which each unique char in the string is a key, and each value is the number of times the char occurs in the given string. 
- rules: 
        - key must be a symbol. 
        - value must be integer 
        - hash should be returned in alphabetical order based on the input string 
        
        - each char should be represented as a symbol in the hash 
        - each key and its associated count value should occur only once in hash. 
- questions: 
  - empty string? return empty hash 
  - case sensitive?
  - 
e: 
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})

d: 
string... array    ....hash 

array: ['c', 'o', 'd'... ]

a: 
- initialize empty hash 
- break string into array of characters
- iterate through the array of chars
  - add char to hash as a symbol 
  - add count of that char as it exists in the input string as the value 
- once reach end of the char array 
- return hash 


def letter_count(string)
  results = {}
  
  char_array = string.chars.sort
  
  char_array.each do |char|
    results[char.to_sym] = string.count(char)
  end 
  
  results 
end 

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

=end








=begin

You are given array of integers, your task will be to count all pairs in that array and return their count.

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)

Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

Examples
[1, 2, 5, 6, 5, 2] --> 2
...because there are 2 pairs: 2 and 5
[1, 2, 2, 20, 6, 20, 2, 6, 2] --> 4
...because there are 4 pairs: 2, 20, 6 and 2 (again)


p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0


p: 
input: array of integers 
output: single integer 
goal: return integer that is equal to the number of pairs of integers in the input array

rules: 
      - pair means integer occurs at least twice
      - count pairs (groups of two occurences) in the input array 
      - if array is empty return 0 
      - if array has only one integer, return 0 
      - if more than one pair of certain integer, count pair only once. 
      
      -integer may be multiple digits long 
      
e: 
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

d: 
array..   hash    ... integer 

hash[integer] => number of pairs 

1 => 0, 2 => 1, 5 => 1, 6 => 0, 

[0, 1, 1, 0] === sum to 2 


a: 
- initialize empty hash 
- iterate through the input array 
  - add integer element as key in the hash 
  - add number of pairs as value 
    - pairs = count of integer in array / 2 
- sum the values in the hash 



def pairs(array)
  int_pairs = {}
  
  array.each do |int|
    int_pairs[int] = array.count(int) / 2
  end 
  
  int_pairs.values.sum  
  
end 

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

=end 







=begin

Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1


p: 
- input: string, substring 
- output: integer 
- goal: return integer equal to the number of times that substring occurs in the given string
- rules: 
        - substring must be contiguous in string 
        - substring should be counted only once per occurence 
  
  questions: 
    can letters be reused?
      'abbbc', 'bb' === 1 or 2? 
      
e: 
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

d: 
string, substring....  substrings         ... single integer 

substrings should be same length as search text substring 
substrings shoudl be contiguous in order appearing in string 

'abbc', 'bb'

[['ab'], ['bb'], ['bc']]

a: 
- create consecutive substrings equal to length of the search text substring
  - initialize substrings array 
  - iterate over string characters
  - pass to substrings array substrings equal length to search text str
  - 
  - 
- count substrings that match search text substring 
  - iterate over the substrings 
  - check if substring is equal to search text 
  - if is, increment a counter by 1
  - continue iteration to end of the substring array 
  
- return count



def search_substr(string, search_text, allow_overlap = true)
  return 0 if search_text.empty? 
  
  if allow_overlap
    substrings = create_substrings(string, search_text)
    substrings.count(search_text)
  else 
    string.scan(search_text).size
  end 
end 

def create_substrings(string, search_text)
  substrings = []
  
  0.upto(string.size - search_text.size) do |start_index|
    substrings << string[start_index, search_text.size]
  end 
  
  substrings 
end 


p search_substr('aa_bb_cc_dd_bb_e', 'bb') == 2
p search_substr('aaabbbcccc', 'bbb') == 1
p search_substr('aaacccbbbcccc', 'cc') == 5
p search_substr('aaa', 'aa') == 2
p search_substr('aaa', 'aa',false) == 1
p search_substr('aaabbbaaa', 'bb',false) == 1
p search_substr('a', '') == 0
p search_substr('', 'a') == 0
p search_substr('', '') == 0
p search_substr('', '',false) == 0

=end












=begin

The vowel substrings in the word codewarriors are o,e,a,i,o. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

p:
input: string 
output: integer 
goal: return integer equal to the length of the longest substring consisting entirely of vowels. 

rules: 
      - vowels include aeiou
      - str will contain only alphabetic chars (a-z)
      - return length of longest vowel substring
      - if no vowel substrings return 0 
      - 


e: 
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8


d: 
string .... array     ...integer 

array 
  - contain substrings 
  - each substring should contain only vowel characters 
  - find longest sustring with only vowel chars 
  
a: 
- create an array of all substrings from the input array 
  - iterate through characters in input string 
    - starting with first char, create substrings of increasing length until reach end of the string
    - move to the next char in the string, create substrings increasing in length until end of string

- create array that includes substrings that contain only vowel characters
  - iterate through substrings array 
  - check if substring includes only vowels 
    - iterate through each char in substring
      - check if char is a vowel
        - if so, move to next char
        - if not, return false for that substring 

- iterate through vowel-only substrings.. check the size of each substring
- return largest size of vowel only substring 



def solve(string)
  substrings = get_substrings(string)
  
  vowel_only_substrings = substrings.select do |substr|
    substr.chars.all? { |char| char.match?(/[aeiou]/) } 
  end 
  
  vowel_only_substrings.map { |substr| substr.size }.max
  
end 

def get_substrings(string)
  substrings = []
  
  0.upto(string.length - 1) do |start_index|
    start_index.upto(string.length - 1) do |end_index|
      substrings << string[start_index..end_index]
    end 
  end 
  
  substrings
end 



p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

=end 








=begin

Given a string of integers, return the number of odd-numbered substrings that can be formed.
For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.
solve("1341") = 7. See test cases for more examples.

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28


p: 
-input: string of integers 
- output: single integer
- goal: return integer equal to the number of substrings that when converted to an integer is odd. 

- rules: 
        - string will consist of only positive integers 
        - odd numbered substrings are substrings that when converted to integers are odd. 
        - odd integers may repeat more than once if separate separate substrings 
e: 
p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

d: 
string....  array        ... integer 

- array 
  - hold each substring of input string
  
a: 
- Create an array containing all possible substrings 
- iterate through the substrings 
  - check if substring, when converted to integer, is odd
  - if so, select it
  - if not, move to the next substring
- count number of odd substrings remaining in the array 
- return count (integer)



def solve(string)
  substrings = get_substrings(string)
  
  odd_substrings = substrings.select do |substr|
    substr.to_i.odd?
  end 
  
  odd_substrings.size
end 

def get_substrings(string)
  substrings = []
  
  0.upto(string.length - 1) do |start_index|
    start_index.upto(string.length - 1) do |end_index|
      substrings << string[start_index..end_index]
    end 
  end 
  
  substrings
end 

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
=end 







=begin


p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]


p:
- input: string
- output: array 
- goal: return array containing two elements, substring and integer.. minimum substring that can be repeated a certain number of times to recreate the input string. 
    - find smallest string that can be repeated to create input string. 
    - return smallest repeatable substring, and number of times it should repeat to create input str. 
- rules: 
        - string will consist of lowercase letters only
        - string will have no spaces or special characters
        - returned array will have two elements.. substring, integer
        - must be able to create the input string by repeating substring x number of times. 
        - if no substring can be repeated to recreate string, return [string, 1]
        
e: 
p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

d: 
string.....   array of substrings      ... array 

array of substrings
  - substrings must be half size of input string or less. 

1. create all substrings up to half size of input string
   select only substrings that when repeated certain number of times == input string
   multiplier will be size of input string / size of substring


a:
- create array of substrings that are up to half size of input str
  - iterate through input string from first char, up to char at halfway point 
  - push substrings to substrings array 
- iterate through substrings array
  - check size of substring
  - check size of input string
  - divide size of input string by size of substring to get multiplier
  - check if substring * multiplier == input str
    - if so, return an array [substring, multiplier]
    - if not, continue iteration
- if no substrings * multipliers == input string
  - return array [inputstring, 1]
  


def f(string)
  substrings = get_substrings(string)
  string_length = string.length
  
  repeatable_substrings = substrings.select do |substr|
    multiplier = string_length / substr.length 
    substr * multiplier == string 
  end 
  
  return [string, 1] if repeatable_substrings.empty?
  
  sorted = repeatable_substrings.sort_by { |substr| substr.size }
  
  multiplier = string_length / sorted[0].length 
  return [sorted[0], multiplier]
  
end 

def get_substrings(string)
  substrings = []
  
  0.upto((string.size / 2) - 1) do |end_index|
    substrings << string[0..end_index]
  end 
  
  substrings
end 

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

=end




=begin

A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The
quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

p:
input: string
output: boolean 
goal: determine if input string contains all characters of alphabet (a-z)
rules: 
      - case insensitive
      - panagram contains all 26 letters of alphabet at least once. 
      - punctuation and numbers should be ignored

e: 
p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

d: 
string....  array      ...boolean

a: 
- create alphabet array containing a-z
- convert string to downcase 
- iterate through characters in string 
  - check alphabet array to see if char is present
    - if so, delete char from alphabet array 
    - if not, continue iteration through the string
- once iteration is complete, check if alphabet array is empty
  - if so, return true
  - else false 
  


def panagram?(string)
  alphabet_arr = ('a'..'z').to_a
  string = string.downcase 
  
  string.chars.each do |char|
    if alphabet_arr.include?(char)
      alphabet_arr.delete(char)
    end 
  end 
  
  alphabet_arr.empty?
end 

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

=end








=begin

Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

p: 
- input: two strings
- output: boolean
- goal: return true if second argument string can be created using letters from str1. 
- rules: 
        - string1 must contain at each char in string2 at least as many times as present in str 2
        - only lowercase letters used (a-z)
        - no punctuation or numbers
        
e: 
p scramble('rkqodlw', 'worldw') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

d: 
two strings ....    arrays         ... true or false 

arrays 
  - characters of each word 
  
a: 
- create two character arrays 
  - array of chars for str1
  - array of chars for str2
- iterate through str1 char array 
  - check if char is present in str2 char array 
    - if so, substitute empty str for that char in str2
    - if not, continue iterating through str 1 char arr
- once iteration is complete
- check if str2 char array is empty. 
  -if so, true, else false



def scramble(str1, str2)
  s1 = str1.dup 
  s2 = str2.dup
  
  s1.chars.each do |char|
    if s2.include?(char)
      s2.sub!(char, '')
    end 
  end 
  
  s2.empty?
end 


def scramble(str1, str2)
  str1_chars_array = str1.chars
  str2_chars_array = str2.chars 
  
  if str2.empty? || str1.empty?
    return false
  else results = str2_chars_array.map do |char| 
    str1_chars_array.include?(char)
    end 
  end 
  results.all?(true)
end

p scramble('rkqodlw', 'worldw') == true
# p scramble('cedewaraaossoqqyt', 'codewars') #== true
# p scramble('katas', 'steak') == false
# p scramble('rkqodlw','world') == true
# p scramble('cedewaraaossoqqyt','codewars') == true
# p scramble('katas','steak') == false
# p scramble('scriptjava','javascript') == true
# p scramble('scriptingjava','javascript') == true
=end 










=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.
Note: If the number is a multiple of both 3 and 5, only count it once.

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

p: 
input: integer 
output: interger (sum)
goal: return sum of all integers from 0 to one less than input integer that are multiples of 3 or 5. 
rules: 
      - natural numbers are positive integers 
      - if any integer is a multiple of both 3 and 5, count it once. 
      - returned integer should be the sum of all multiples of 3 and 5 up to given integer
      
question: what is a natural number?

e: 
p solution(10) == 23
p solution(20) == 78 # [3, 5, 6, 9, 10, 12, 15, 18]
p solution(200) == 9168

d: 
integer....   range/array          ... integer(sum)

range: numbers from 0 to input number 
array: numbers within the range that are multiples of 3 or 5

a: 
- create a range from 0 to input number 
- initialize multiples array (empty)
- iterate through range 
  - check if each number is a multiple of 3, or a multiple of 5
    - check if number % 3 == 0 or number % 5 == 0 
      - if so, push to multiples array 
      - if not, continue iteration
- sum multiples array 
- return sum 

c: 


def solution(integer)
  range = (0...integer)
  multiples = []
  
  range.each do |num|
    if num % 3 == 0 || num % 5 == 0 
      multiples << num 
    end 
  end 
  
  multiples.sum 
end 

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168
=end 











=begin

Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:
greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0


p: 
input: string of numbers 
output: integer (product)
goal: find product of 5 consecutive numbers in the given string that produce the largest product.
rules: 
      - input string will have more than 5 characters 
      - each char in string will be a number 
      - greatest product, is highest number produced by multiplying 5 consecutive digits from input
      
e: 
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

d: 
string....     array            ...integer(product)

needs: 
  - create substrings that are consecutive 5 characters

a:
- create array of substrings that are all 5 consecutive characters long 
  - iterate through input string
    - starting at first char.. 
      - iterate through 5 chars
      - add substring to substrings array 
- iterate through substrings 
  - convert each substring to integer 
  - break the integer into digits 
  - find product of digits in that substring 
- choose the largest product from the substring array 
- return product (integer)



def greatest_product(string)
  substrings = find_substrings(string)

  substr_products = substrings.map do |substr|
    substr.chars.map(&:to_i).inject(:*)
  end 
  
  substr_products.max
end 

def find_substrings(string)
  substrings = []
  
  0.upto(string.length - 5) do |start_index|
    substrings << string[start_index, 5]
  end 
  
  substrings
end 

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

=end 






=begin

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"ABBA" -> 2 # 'A' and 'B' each occur twice

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2


p: 
- input: string
- output: integer (count of characters that occur more than once in the str)
- goal: return integer that is equal to the number of character in the input string that occur more than one time. 
- rules: 
        - case insensitive.... 'AaBb' == 2   
        - empty string return 0 
        - input string will contain only alphanumeric chars 
        - number of occurences greater than 2 is irrelevant to count 
        - return number of unique chars that occur more than once in input string 

e:
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2


d: 
string....      hash        ....integer (count of duplicated chars)

 hash 
  - key: char (case insentive) => value (number of occurences in the string)

a: 
- initialize empty hash to hold char => count
- convert string to lowercase 
- iterate through string characters
  - add each char to hash as key and assign value as the count of that char in string
- iterate through hash 
  - select hash elements that have value of 2 or more 
  - check size of returned hash with selected elements 
- return size of selected elements hash 



def duplicate_count(string)
  char_count_hash = {}
  
  chars_array = string.downcase.chars 
  
  chars_array.each do |char|
    char_count_hash[char] = chars_array.count(char)
  end 
  
 char_count_hash.values.count { |num| num > 1 }
end 
  
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
        
=end 











=begin

Given a List [] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list should equal the closest prime number .

List size is at least 2 .
List's numbers will only have positives (n > 0) .

Repetition of numbers in the list could occur .

The newer list's sum should equal the closest prime number .

Input >> Output Examples

1- minimumNumber ({3,1,2}) ==> return (1)
Explanation:
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime
number is (1) , which will make *the sum of the List** equal the closest prime number (7)* .

2- minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime
number is (5) , which will make *the sum of the List** equal the closest prime number (37)* .

3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime
number is (2) , which will make *the sum of the List** equal the closest prime number (191)* .

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2


p: 
- input: array of integers 
- output: single integer(minimum number to convert array sum to prime number)
- goal: find the minimum number that when added to the current sum of the input array, would make the sum the closest occuring prime number 
- rules: 
  - sum of all elements in the array (plus returned integer) should be closest prime number to the original sum of the array before adding in returned integer. 
  - array will contain at least 2 elements
  - elements will be positive integers only 
  - find integer that when added to input array, sums to closest prime number
  - prime number is not evenly divisible by anything other than itself and 1 
  - if sum is prime already, return 0 

e: 
p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2


d: 
array.....            ... integer (element to be added to sum of input array)

1. find sum of the input array (integer)
2. check if the sum is prime? 
  - if so, return 0 
3. find next prime number 
  - initialize range from current sum..infinity 
  - iterate through range, check if number is prime? 
    - if so, break iteration and return that number (next prime number)
4. subtract current sum, from next prime number to get needed integer. 

a:

- find the sum of the input array, save to local var
- check if current sum, is prime.. **
  - if so, return 0
- create range from current_sum + 1 to infinity... 
  - iterate through the range
    - check if current number is prime?
    - if so, break iteration and return the prime number 
    - save prime number to local var
- subtract current sum from next prime number to get difference (integer to return)
- return integer


** check if number is prime
  - iterate from 2...num
  - check if num % current_num in iteration == 0
    - if so, return true
  - if reach end of iteration and true is not returned, return false 
  


def minimum_number(array)
  current_sum = array.sum
  next_prime_num = nil
  
  return 0 if is_prime?(current_sum)
  
  (current_sum + 1..).each do |num|
    if is_prime?(num)
      next_prime_num = num 
      break 
    end 
  end 
  
  minimum_num = next_prime_num - current_sum
  minimum_num 
end 

def is_prime?(integer)
  2.upto(integer - 1) do |divisor|
    return false if integer % divisor == 0
  end 
  
  true 
end 

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
=end








=begin

You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:

Let's say you are given the array {1,2,3,4,3,2,1}: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

Let's look at another one.

You are given the array {1,100,50,-51,1,1}: Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

Last one:

You are given the array {20,10,-80,10,10,15,35}
At index 0 the left side is {}
The right side is {10,-80,10,10,15,35}
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

Input:
An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.

Output:
The lowest index N where the side to the left of N is equal to the side to the right of N. If you do not find an index that fits these rules, then you will return -1.

Note:
If you are given an array with multiple answers, return the lowest correct index.

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1


p: 
- input: array of integers (postive and or negative)
- output: single integer (index where left side of index sum == right of index sum)
- goal: find index in the input array where left of index sum == right of index sum 
- rules: 
        - array elements will be integers
        - elements may be positive or negative integers 
        - at index 0, left side sum == 0 
        - at index -1 right side sum == 0 
        - if no index within input array satisfies requirement, return -1
        - if array has multiple indexes that meet requirement, return lowest index. 
        - integer at target index is not included in sum 
        
e: 
p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

d: 
array....                  ....integer(index)

[0].sum == [2, 3, 4, 3, 2, 1].sum
[1].sum == [3, 4, 3, 2, 1].sum 
[1, 2].sum == [4, 3, 2, 1].sum 

needs: 
  - iterate through input array by index 
  - create left sum (sum of elements prior to index)
  - create right sum (sum of elements after the index)
  
  - if index is 0, left sum == 0 
    - right sum (sum of elements from index + 1..arr.size -1)
    
  - if index is 2
    - left_sum (sum of elements from index 0..index - 1)
    - right_um (sum of elements from index + 1..end of array)
    
  - if index is == arr.size - 1
    - left sum (sum of elements from 0..index - 1)
    - right_sum == 0 
    
a: 
- iterate through input array by index 
  - check if index is 0 
    - if so, assign left sum to 0 
    - assign right sum (index + 1..arr.size -1).sum 
    - check if leftsum == rightsum 
      - if so, return index 
      - if not, next iteration
  - check if index is arr.size - 1
    - if so, assign left_index (0..index - 1).sum 
    - assign right index == 0 
    - check if left_sum == right_sum
      - if so, return index 
      - if not, return -1 
  - if index is not 0 or arr.size - 1
    - assign left sum (0..index - 1).sum 
    - assign right sum (index + 1..arr.size - 1).sum 
    - check if right_sum == left_sum 
      - if so, return index
      - if not, next iteration. 

# require 'pry'
# def find_even_index(array)
#   array.each_with_index do |num, idx|
#     if idx == 0 
#       left_sum = 0 
#       right_sum = array[idx + 1..-1].sum 
#       return idx if left_sum == right_sum 
#     elsif idx == array.size - 1
#       left_sum = array[0..idx - 1].sum 
#       right_sum = 0 
#       return idx if left_sum == right_sum 
#     else 
#       left_sum = array[0..idx - 1].sum 
#       right_sum = array[idx + 1..-1].sum
#       return idx if left_sum == right_sum 
#     end 
#   end 
  
#   -1 
# end 

def find_even_index(arr)
  arr.each_with_index do |num, idx| 
    return idx if arr[0...idx].sum == arr[idx + 1..-1].sum
  end 
  
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1


=end 


=begin
Given an array of integers, find the one that appears an odd number of times.

There will always be only one integer that appears an odd number of times.

Examples
[7] should return 7, because it occurs 1 time (which is odd).
[0] should return 0, because it occurs 1 time (which is odd).
[1,1,2] should return 2, because it occurs 1 time (which is odd).
[0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
[1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
find_it([10]) == 10
find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10



p: 
- input: array of integers 
- output: single integer (integer from array that occurs odd number of times)
- goal: identify and return the single integer in the input array that occurs an odd number of times within the array. 
rules: 
      - will always be only one odd occurring integer in the array

e: 
find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
find_it([10]) == 10
find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10


d: 
- array...               ....integer (element of the array)

a: 
- iterate through array
  - pass each element to block
    - count occurences of element within the input array 
    - if count is odd? return element
c: 



def find_it(array)
  array.each do |int|
    return int if array.count(int).odd?
  end 
end 

p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10

=end 




=begin
There is an array with some numbers. All numbers are equal except for one. Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
It’s guaranteed that array contains at least 3 numbers.

find_uniq([1,1,1,1,0]) == 0
find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

p: 
- input: array of numbers 
- output: number that is not equal to other numbers 
- goal: find the element inside the array that is not repeated. 
- rules: 
  - all numbers (elements) are equal except for one. 
  - element may be integer or float
  - returned element will be element that occurs only once in the array 
  
e: 
find_uniq([1,1,1,1,0]) == 0
find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55


d: 
array....   hash       ...  number(element from the array)

hash[element] => count 

return key with value == 1 

a: 
- initialize empty hash 
- iterate through the input array 
  - pass each element to block
    - build hash with key as element, and value as count of that element in input array 
- iterate through hash, return key with value of 1



def find_uniq(array)
  element_count_hash = {}
  
  array.each do |num|
    element_count_hash[num] = array.count(num)
  end 
  
  element_count_hash.each do |element, count|
    return element if count == 1
  end 
end 


def find_uniq(array)
  array.each do |num|
    return num if array.count(num) == 1
  end 
end 

p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

=end 


=begin

Given two arrays a and b write a function comp(a, b) that checks whether the two arrays have the "same" elements,with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

Examples

Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. 

It gets obvious if we write b's elements in terms of squares:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

Invalid arrays
If we change the first number to something else, comp may not return true anymore:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.


Remarks
a or b might be [] (all languages except R, Shell).
a or b might be nil 

If a or b are nil the problem doesn't make sense so return false.


p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false


p: 
- input: two arrays 
- output: boolean
- goal: return true if elements in second array include only the squares of elements in first array.
- rules: 
        - arrays must be same size 
        - if first or second array is nil or empty? return false
        - second array must contain squares of each element in first array same number of times that the element appears in the first array 
e: 
p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false

d: 
array1, array2 (arrays of integers)....    array(squares of arr 1)    ....true or false 

a: 

- return false if arr1 or arr2 is empty or nil 
- return false if arr1.size != arr2.size

- initialize squares array (empty)
- iterate over array 1
  - square each element 
  - pass each squared element to squares array 
- sort squares array
- sort array2
- check if squares array == arr 2
  - if so, return true, else false 



def comp(arr1, arr2)
  return false if arr1.nil? || arr2.nil?
  return false if arr1.size != arr2.size 
  
  squares_array = arr1.map { |num| num**2 } 
  
  squares_array.sort == arr2.sort 
end 

# p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
# p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
# p comp(nil, [1, 2, 3]) == false
# p comp([1, 2], []) == false
# p comp([1, 2], [1, 4, 4]) == false
# p comp([4, 4], [1, 31])

=end 



=begin
Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * entire pair is earlier, and therefore is the correct answer
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * entire pair is earlier, and therefore is the correct answer
== [3, 7]
Negative numbers and duplicate numbers can and will appear.

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]
=end 




=begin
Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a
hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of
the array, and as values the counting of each value.
Example usage:
input = [1,1,2,2,2,3]
group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:
Array#count
Array#length

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}
=end



=begin
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even
indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing
just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.
The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are
multiple words. Words will be separated by a single space(' ').

p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"
=end


=begin 
# The alphabetized kata
# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

# The input is restricted to contain no numerals and only words containing the english alphabet letters.



p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")
== "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabetized("!@$%^&*()_+=-`,"), "")
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"


p:
input: string 
output: new string 
- goal: return new string sorted alphabetically and by order of appearance in regard to case of each char. whitespaces and non-alphabetic chars are removed. 
- rules: 
  - the input string will only contain alphabetic characters 
  - string may contain uppercase and lowercase chars
  - returned string should not include spaces or non-alphabetic chars 
  - returned string should be sorted alphabetically and in order of appearance of each character. 

e: 
p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")
== "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabetized("!@$%^&*()_+=-`,"), "")
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

d: 

string ....    array            ...new string(input string changed to meet criteria) 

needs: 
  - remove whitespace and non-alphabetic chars 
  - sorted string chars by order of appearance. 

  'Acda' == 'Aacd'


a: 
- delete spaces and non-alphabetic chars 
- sort string alphabetically by downcased char 

=end 

=begin
In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

p solve(123056,1) == '12056'
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'
=end 


=begin
Given: an array containing hashes of names
Return: a string formatted as a list of names separated by commas except for the last two names, which should be
separated by an ampersand.

Example:
list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'
list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'
list([ {name: 'Bart'} ])
# returns 'Bart'
list([])
# returns ''
Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.


input: arr
output: str 
goal: extract names from hashes in array and insert into string.
rules: 
      - names should be separated by comma 
      - final name should be separated by & 
=end

=begin

Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are
substrings of strings of a2.

#Example 1: a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns ["arp", "live", "strong"]
#Example 2: a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns []


Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
Beware: r must be without duplicates.
Don't mutate the inputs.
=end

=begin

Write a function
triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2. If this isn't the case, return 0


Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and num2 has straight double 99s
triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2


p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1

input: two integers
output: 0 or 1 
goal: find out if there is a digit that repeats itself consecutively 3 times in the first integer, and also twice in the second integer. if so, return 1, if not, return 0.
rules: 
  - in order to return 1
    - first integer must have repeating digit (3 times) and second integer must have same repeating digit (twice)
    
  - questions.. what about more than 3 or 2 times?
  
e:
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1

d: 
integer...     arrays             ..0 or 1

a: 
- create two arrays of substrings
  - first array
    - substrings of 3 consecutive integers 
  - second array
    - substrings of 2 consecutive integers 
    
  - filter out only subarrays with same integers
  - check if second array contains element present in arr 1
  
=end 

# def triple_double(num1, num2)
#   triples = repeats(num1, 3)
#   doubles = repeats(num2, 2)
  
#   return 1 if triples.any? { |num| doubles.include?(num) }
  
#   0
# end 

# def repeats(num, size)
#   str = num.to_s 
#   all_substrings = []
  
#   if size == 3 
#     0.upto(str.size - 3) do |start_index|
#       all_substrings << str[start_index, 3]
#     end 
    
#     triples = all_substrings.select do |substr|
#       substr.chars.all?(substr[0])
#     end 
    
#     return triples.map { |str| str.split('').uniq }.flatten
  
#   elsif size == 2 
#     0.upto(str.size - 2) do |start_index|
#       all_substrings << str[start_index, 2]d
#     end 
    
#     doubles = all_substrings.select do |substr|
#       substr.chars.all?(substr[0])
#     end 
    
#     return doubles.map { |str| str.split('').uniq }.flatten
#   end 
# end 

#p triple_double(12345, 12345) == 0
# require 'pry'
# def triple_double(num1,num2)
#   num1 = num1.to_s
#   num2 = num2.to_s
#   10.times do |i|
#     binding.pry
#     if num1.include?(i.to_s*3) && num2.include?(i.to_s*2)
#       return 1
#     end
#   end
#   return 0
# end


# p triple_double(666789, 12345667) == 1



=begin
# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
                            == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".

p:
- given an array of intgers, for each integer, check to see how many other integers in the given array are lesser in value. return array equal in size to given array, with count values as elements. 

- input:
  - array of integers

- output:
  - array of integers (counts)

- rules:
  - only count unique values in determining the number of integers less than that number
  - output array will be same size as input array
  - each element in output array will be count of corresponding integer values that are less than it. 
  - input array contains only positive integers
  - ouput array contains only positive integers 
  - if no elements in array are lesser than selected element, return 0 for that element in output array 
  
d:
  - input: array of integers
  
  - output: array of integers 
  
a:
  - create a unique elements array 
  - iterate through the input array 
  - for each integer, count within unique elements array, how many are smaller 
  - push this count to results array 
  

require 'pry'
def smaller_numbers_than_current(array)
  unique_elements = array.uniq
  results = []
  
  array.each do |num|
    results << unique_elements.count do |uniq_num|
                uniq_num < num 
              end 
  end 
  p results 
end 
  

  
  
  
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
=end 

=begin
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".



p:
-given an array of integers, return smallest possible sum of 5 consecutive integers in the input array.
- input: array of integers
- output: single integer (smallest sum)
- rules: 
        - input array made up of integers, positive and negative
        - summed numbers must be consecutive 
        - if contains less than 5 nums, return nil 
        
d:
input: array 
intermed: sub_arrays
output: integer 

a:
- create sub_arrays of 5 consecutive integers from input array 
  - iterate over given array from start to last positin where 5 consecutive elements are possible. [1,2,3,4,5,6,7] size - 5
  - save sub_arrays to empty array 
  - 
- sum each sub_array 
  - iterate through sub_arrays
  - sum each
  - compare to lowest_current_sum 
  - if sum < lowest_current sum, that sum becomes lowest_sum 
- return smallest sum 



arr = [1,2,3,4,5,6,7] = [[1, 2, 3, 4, 5], [2, 3, 4, 5, 6], [3, 4, 5, 6, 7]]

0.upto(arr.size - 5) do |start_index|
  result << arr[start_index..start_index + 4]
end 
  


def get_sub_arrays(arr)
  result = []
  
  0.upto(arr.size - 5) do |start_index|
    result << arr[start_index..start_index + 4]
  end 
  
  result 

end 

def minimum_sum(arr)
  return nil if arr.size < 5

  subarrays = get_sub_arrays(arr)
  
  summed_subs = subarrays.map do |subarr|
    subarr.sum 
  end 
  
  summed_subs.min
end 




p minimum_sum([1, 2, 3, 4]) == nil
 p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

=end


=begin 

# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".


p: method should take a string and return a string with every second char in every third word upcased. Other characters in the string should remain the same. 
- input: string
- output: string
-rules: input string will consist of lowercase alphabetic letters
        - if input string contains less than 3 words, return string 
        - every third word starts with word at index 2 of string (array form)
        - every other character, starts with second character of string
        - non-target words should remain the same 
- questions:
            - should returned string be same string or new string?
            - if char were already upcased, leave or change to downcase?
            
E: 
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
  
D:
- iput: string
- intermed: arrays
- output: string (new or same)

A:
  - initialize target_index for first word to be manipulated 
  - initialize result array to push words to 
  - split string into array of words 
  - iterate through each word by index
    - if index is not equal to target_index 
    - add word as is, to results array 
      - if index is equal to target index:
        - initialize chars_array 
        - iterate through each char in word by index 
        - if index is even add char to chars_array
        - if index is odd, add upcased char to chars array 
        - join chars array back to word
        - add word to results array 
        - increment target_index by 3
  - once all words are added back to results array 
    - join results array and return it. 
    
    

def to_weird_case(string)
  target_index = 2           # position of first third-word
  results = []               # to push full words to 
  words_array = string.split
  
  words_array.each_with_index do |word, index|
    if index != target_index 
      results << word 
    else 
      chars_array = []
      word.chars.each_with_index do |char, char_index|
        if char_index.even?
          chars_array << char 
        else 
          chars_array << char.upcase 
        end 
      end 
      results << chars_array.join
      target_index += 3
    end 
  end 
  results.join(' ')
end 

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

=end


# Write a method that takes an array of integers and returns the
# two numbers that are smaller together in value.

# Examples:

# p smaller_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p smaller_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p smaller_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

=begin

p: 
-input: array of integers 
-output: array of 2 integers 
- rules: 
        - input array will contain positive integers 
        - output will be two integers from input array that are smaller in value 
        - returned array should be in order of appearance in input array 

e:
p smaller_numbers([5, 25, 15, 11, 20]) == [15, 11]
p smaller_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p smaller_numbers([12, 7, 17]) == [12, 7]

arr[start] - arr[end]
arr[0] - arr[2]
arr[0] - arr[3]

d:
- input: array of integers 
- intermed: 
- output: array of integers (2)

a:
- iterate through the input array 

- for each integer
  - calculate the abs value difference between that integer and every other integer
    - create a current_smallest_difference = -1
    - current_smaller_integers = []
    
    - create a start index for first integer to be compared [0]
    - create an end index for second integer in comparison [start_index + 1]
  
  - subtract intger at start index - integer at end index
    - if absolute value difference is less than current_smallest difference or if current_smallest difference is < 0. absolute value diff becomes current_smallest and two integers being compared become current smaller. 
    
    - increment end index by 1
    - continue comparisons until after compared end index is array size - 1
  
  - increment start index
  - reassign end index to start_index + 1
  - continue iteration
  

  - return current_smaller_integers array 


def smaller_numbers(array)
  smallest_difference = -1 
  smaller_integers = []

  
  0.upto(array.size - 2) do |start_index|
    (start_index + 1).upto(array.size - 1) do |end_index|
      current_difference = (array[start_index] - array[end_index]).abs
    
      if current_difference < smallest_difference || smallest_difference < 0 
        smallest_difference = current_difference
        smaller_integers = [array[start_index], array[end_index]]
      end 
    end 
  end
   
  smaller_integers
end 

        
p smaller_numbers([5, 25, 15, 11, 20]) == [15, 11]
p smaller_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p smaller_numbers([12, 7, 17]) == [12, 7]
=end 
=begin

Hi,everyone! I am working through the practice problems preparing for the 109 interview and I ran into an issue with my approach. 

Essentially, I am trying to find the smallest difference between two integers in an array. I decided to iterate through the array, calculate the difference between each set of two integers and compare the absolute value of each difference (current_difference) with the smallest_difference. If the current_difference is smaller, then it becomes the new smallest difference. 

The issue I'm having is trying to figure out how to manage the first iteration and establishing the initial smallest_difference. If I initialize smallest_difference before beginning iteration, I am unsure of which integer to use so that the first current_difference, would become my starting smallest_difference. If I initialize smallest_difference to 0 or nil, and want to assign current_difference to smallest_difference if it is less than smallest_difference, that would not work.

Basically, I'm trying to figure out if there is a way to initialize an empty integer to smallest_difference so my first iteration would return true to the comparison of current_integer < smallest_integer, and I could use that value for the remaining comparisons. My workaround, because there were not negative numbers in the test cases, was to initialize smallest_difference to -1 and use a conditional to assign smallest_difference to current_difference if smallest_difference was less than 0. 

=end


# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.

# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. 

 #When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

# p least_common_char("Hello World") #== "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
# p least_common_char("Mississippi") #== "m"
# p least_common_char("Happy birthday!") #== ' '
# p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".


=begin

P: 
input: string
output: string (character)
rules: 
      - return character that occurs least often in given string 
      - if multiple characters present least number of times, return first occurence of character
      - counts of characters are case insensitive
      - spaces count as characters 
      - returned character should be lowercase
      
e: 
p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

d: 
- input: string
- intemed: array, hash?
- output: string char

a: 

- break string into characters...(preserve spaces)
- initialize a hash to store chars and counts 
- iterate through characters 
- count occurances of each character 
- add character as key in hash, and count as value 
- identify the character(s) with smallest count 
  - if mutliple chars have same smallest count
  - check index of first occurence of each character
  - return character with smallest index
- return that character 


c: 


def least_common_char(str)
  char_array = str.downcase.chars
  char_count_hash = {}
  
  char_array.each do |char|
    char_count_hash[char] = char_array.count(char)
  end 
  
  sorted_hash = char_count_hash.sort_by { |k, v| v }
  sorted_hash[0][0]
  
end 
  

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

=end

# def pairs(str)
#   str = str.chars
#   pairs_array = []
  
#   pairs_array << str.shift(2) until str.empty?
  
#   pairs_array.each do |subarr|
#     if subarr.size < 2
#       subarr << '_'
#     end 
#       subarr.join
#     end 
#     new = pairs_array.map do |suba|
#       suba.join
#     end 
#     p new
# end 
# p pairs('abc')
  

# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

=begin

p:
- input: array of integers 
- output: two element array 
- rules: 
        - returned array contains two integers as elements
        - returned array contains two integers from given array closest in value 
        - two elements in returned array should be two elements with smallest difference (abs)
        - if more than two elements are equally distant, return in order of occurance in given array
e;
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]


d: 
- array... sub_arrays ... array 

1. create all possible two element combinations in sub_arrays.. calculate difference. return sub_arr with smallest difference (abs value)

2. iterate through array checking difference between each.. use local variables to store current_arr and current_smallest_difference. 


a: 
- create 2 element sub_arrays of all unique combinations of integers 
- iterate through each sub_arr and calculate absolute value difference 
- return sub_arr with smallest abs value difference 

=end

# def closest_numbers(arr)
#   sub_arrays = arr.combination(2)
  
#   current_closest_difference = (sub_arrays[0][0] - sub_arrays[0][1]).abs
#   current_closest_subarray = subarrays[0]
  
#   sub_arrays.each do |subar|
#     if (subar[0] - subar[1]).abs < current_closest_difference 
#       current_closest_subarray = subar 
#     end 
#   end 
  
#   current_closest_subarray
# end 

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]




# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

# p least_common_char("Hello World") #== "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
# p least_common_char("Mississippi") #== "m"
# p least_common_char("Happy birthday!") #== ' '
# p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".

=begin
p:
input: string 
output: string character 
rules: 
      - identify char in string that occurs least often 
      - spaces are eligible as characters 
      - non alphanumerics are eligible as characters
      - if a character is present equal number of times in string as another,
        - return once that appears first in the given string
      - case does not matter 

e:
p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

d: 
string.... hash... 'string char'

a: 
- split the string into array of characters ** preserve spaces 
- iterate through the characters
  - build hash.. char is key, count in the string is the value 
- return the key whose value is smallest and occurs first in the string 

c: 
=end

# def least_common_char(str)
#   downcased_str = str.downcase 
#   chars_array = downcased_str.chars 
#   char_count_hash = {}
  
#   chars_array.each do |char| 
#     char_count_hash[char] = downcased_str.count(char)
#   end 
  
# char_count_hash.key(char_count_hash.values.min)
# p char_count_hash.values_at('a', 'e', 'i')
# end 

# p least_common_char("Hello World") 
# p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
# p least_common_char("Mississippi") == "m"
# p least_common_char("Happy birthday!") == ' '
# p least_common_char("aaaaaAAAA") == 'a'



=begin

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

=end



=begin
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string
and you must return that string in an array where an uppercase letter is a person standing up.
Rules
1. The input string will always be lower case but maybe empty.
2. If the character in the string is whitespace then pass over it as if it was an empty seat.


p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs",
"codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs",
"two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]


=end 


=begin

In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

More examples in the test cases.

Good luck!

p solve(123056,1) == '12056
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'


def solve(n,k)
  n = n.to_s

  k.times do |_|
    substrings = n.chars.map.with_index do |_, idx|
                   substr = n.dup.chars
                   substr.delete_at(idx)
                   substr.join
                 end
    p substrings
    n = substrings.min
  end

  n
end
=end 



=begin
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.


p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No','No']) == 'No'
p nth_char(['Chad','Morocco','India','Algeria','Botswana','Bahamas','Ecuador','Micronesia'] == 'Codewars'

=end 



=begin
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.


solve(["abode","ABc","xyzD"]) == [4,3,1])
solve(["abide","ABc","xyz"]) == [4,3,0])
solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7])
solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3])

=end 





=begin 
Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.

Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the english alphabet letters.

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

=end 



=begin

Write a method named to_weird_case that accepts a string, and
returns the same sequence of characters with every 2nd character
in every third word converted to uppercase. Other characters
should remain the same.

Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".


=end 




=begin

You are given an array which contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

You can asume there is never an empty array and there will always be an integer.

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]


=end 




=begin

=begin
Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.


p minSubLength([2,3,1,2,4,3], 7) == 2    (4 and 3)
p minSubLength([1, 10, 5, 2, 7], 9) == 1    (10)
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4 (100, 1, 0 , 200)
p minSubLength([1, 2, 4], 8) == 0  (none greater than 8)


=end 




=begin


=begin

Given a string of digits and returns a string representing the 
highest integer made with 3 of the same consecutive integers. 

Rules: 
- return an empty string if no 3 con identical digits


examples: 


p largest_good_integer('13455587222') == "555"
p largest_good_integer('456987') == ""
p largest_good_integer("11458000") == "000"
p largest_good_integer("111") == "111"
p largest_good_integer("111222333444555666") == "666"
p largest_good_integer("42352338") == "" 


=end 



=begin

Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

=end



=begin
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

=end 



=begin

# Write a method that takes an array of integers and returns the
# two numbers that are smaller together in value.

# Examples:

# p smaller_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p smaller_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p smaller_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

=end


=begin

# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.

# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. 

 #When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

# p least_common_char("Hello World") #== "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
# p least_common_char("Mississippi") #== "m"
# p least_common_char("Happy birthday!") #== ' '
# p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".

=end 



=begin
rite a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:


rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true


P; 
input: array 
output: new array
goal: return a new array with the first element of the given array rotated to the end. 
rules: 
      - move the first element of the given array to the end
      - cannot use rotate method
      - cannot mutate the original array 
      
d: 
  - arrays

a: 
- initialize new empty array 
- iterate through the array 
  - start at second element, through the end of the given array 
  - add each element to the new array 
- append the first element from the given array to the new array 

=end

# def rotate_array(arr)
#   results = []
  
#   1.upto(arr.size - 1) do |index|
#     results << arr[index]
#   end 
#   results << arr[0]
#end 

=begin
input: integer, and integer
output: integer
goal: based on the second argument, rotate the indicated digit of the input number to teh end of the number. 
rules: 
      - the digit to be rotated to the end of the integer is located at -n (second argument)
      - n will always be positive integer
      - return value will be an integer of same length that contains same digits as input number. with indicated digit moved to end. 
      
d: integers
  arrays
  integer
  
a: 
- iterate through array of digits.. by index
- add each digit to results array 
  - except if the digit is located at -n index of the array (index arr.size - n)
- append digit at -n index to the results array after iteration
- join the arrat back an integer 
-return integer 

=end 

# def rotate_rightmost_digits(integer, digits)
#   results = []
  
#   digit_array = integer.digits.reverse
  
#   digit_array.each_with_index do |dig, index|
#     unless index == (digit_array.size) - digits 
#       results << dig 
#     end 
#   end 
#   results << (digit_array[-digits])
#   results.join.to_i 
# end 

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917


=begin

p: integer
output: integer
goal: return integer that is the max rotation of the input integer 

rules: 
      - integer should be rotated based on incrementing index. 
      - first digit to be rotated is at index 0 
        - using returned integer, next rotation is index 1..
      - break if index == digits size - 2


a: 
- break integer into array of digits
- starting at index 0 of array, 
  - rotate that digit to end of the array 
  - save return value
- at index 1 of the array 
  - rotate that digit to end
  - save return value
- repeat until index == arr size -2 (after rotating that digit)
- join array to integer and return it 


=end


# P: 

# input: integer
# output: array (switches that are on)
# rules:  
#       pattern..
#       all lights start off 
#       - starting at 2, toggle every even number lights
#       - starting at 3, toggle every odd number lights
#       - starting at 4, toggle even lights
#       - starting at 5, toggle odd lights 
      
#       - complete n repititons (number of lights)
      
#       data: 
      
#         hash.. 1..n as keys, initially on
        
#     a: 
#     - create hash with 1..n as keys and values as all on
#     - set local variable to evens = true 
#     - set even_lights index = 1
#     - set odd_lights index = 2
#       - n times do 
#         - if evens == true 
#       - starting at second number(index 1), toggle each odd indexed light 
#         - increment even_lights index by 2
#         - !evens 
#       -if evens == false 
#       - starting at third number (index 2) toggle every even indexed light 
#         -increment odd_lights index by 2
#         - !evens 
# require 'pry'        
# def lights(integer)
#   lights_hash = (1..integer).to_a.each_with_object({}) do |num, hash|
#     hash[num] = true
#   end 
  
#   even_lights_start = 2
#   odd_lights_start = 3
#   evens = true 
  
#   integer.times do 
#     if evens
#       lights_hash.each do |key, value|
#         if key >= even_lights_start && key.even?
#           lights_hash[key] = !value
#         end 
#       end
#       even_lights_start += 2
#     else 
#       lights_hash.each do |key, value|
#         if key >= odd_lights_start && key % 3 == 0
#           lights_hash[key] = !value 
#         end 
#       end
#       odd_lights_start += 3
#     end
#     #binding.pry
#     evens = !evens 
#   end 
#   p lights_hash
      
# end   
  
    
# lights(10)


# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

# diamond(1)
# *

# diamond(3)
# *
# ***
# * 
 
# diamond(9)
#     *  (1)
#   ***(3)
#   ***** (5)
# ******* (7)
# ********* (9)
# *******(7)
#   *****(5)
#   *** (3)
#     *  (1)
    
    
# Create diamond pattern based on integer input:
# - input: integer (odd)
# - output: pattern of * strings 
# rules: 
#       - input integer will be odd
#       - will be displayed in integer * integer grid
#         ex: diamond(3) will have three lines, and middle line will have max 3 spaces
#       - each pattern starts at 1.. equal spaces on each side..(9 will gave 4 spaces on each side on first line)
#       - increments next line by 2  - 3 diamonds with 3 spaces on each side 
#       - increment by 2, next line will have 5 diamonds with two spaces on each side 
#     - incrementing number of diamonds by 2 each line.. starting from 1
#     - reducing spaces on each side of diamonds by 1 each line 
#     - once complete integer number line, 
#       - increment spaces by 1 on each side, 
#       - reduce diamonds by 2 each line
      
# diamond 5
# - first line: space, space, *, space, space. 1 * and 2 spaces on each side
# - second line: space, * * *, space. 3 * and one space on each side 
# - thrid line.. ***** - 5 * and 0 spaces
# - fourth line .. space, ***, space.. 3 * and one space on each side 
# - 5th line.. space, space, *, space, space. 1* and 2 spaces on each side 


# number of spaces on each side.. integer/2 for first line...
#   - reducing by 1 each line until reach 0, then incrementing by 1 until reach integer/2
  
# number of diamonds on first line is 1, incrementing by 2 until reach integer then reducing by 2 

# keep track of 
# - spaces on each side
# - number of *s 

# a: 
# - initialize spaces to empty space
# - number_of_spaces = integer / 2
# - initialize star to '*'
# - starting star = 1
# - until star = integer 
#   (1)
#   - insert integer / 2 spaces
#   - insert star 
#   - insert integer / 2 spaces 
  
#   - increment star by 2
#   - reduce spaces by 1 
  
# - until star = 1
#   - continue incrementing spaces on each side by 1
#   - continue reducing stars by 2 
  

# def diamond(integer)
#   space = " "
#   star = '*'
#   number_of_stars = 1
#   number_of_spaces = integer / 2

#   loop do 
#     puts (space * number_of_spaces) + (star * number_of_stars) + space * number_of_spaces
#     break if number_of_stars == integer
#     number_of_stars += 2
#     number_of_spaces -= 1
#   end 
  
#   loop do 
#     number_of_stars -= 2
#     number_of_spaces += 1
#     puts (space * number_of_spaces) + (star * number_of_stars) + space * number_of_spaces
#     break if number_of_stars == 1
#   end 
# end 

# diamond(63)

=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

/\b#{foo}\b/


input: string
output: string
rules: 
      - if input string contains any number words.. one..nine
        - convert the word to digit string.. '1'..'9'

a: 
- create hash with keys as number words.. values as digits 
- iterate through the input string 
  - if current word is a number word, convert it to the digit 
  -return string



=end

# def word_to_digit(str)
#   word_digit_hash = { 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
#                       'five' => '5', 'six' => 'six', 'seven' => '7', 'eight' => '8', 
#                       'nine' => '9' }
  
#   word_digit_hash.each do |word, digit|
#     if str.include?(word)
#       str.gsub!(word, digit)
#     end 
#   end 
#   p str
# end 

# p word_to_digit('Please call freight at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


# Create a function with two arguments that will return an array of the first (n) multiples of (x).

# Assume both the given number and the number of times to count will be positive numbers greater than 0.

# Return the results as an array (or list in Python, Haskell or Elixir).

# Examples:

# count_by(1,10) #should return [1,2,3,4,5,6,7,8,9,10]
# count_by(2,5) #should return [2,4,6,8,10]


# p:
# - input: two integers (multiples, number)
# - output: array 
# rules: should return mutliples of the first argument, second argument number of times. 


=begin

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.


def greetings(arr, hash)
  puts "hello, #{arr.join(' ')}!" + 
       " Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end 

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=end

=begin

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

P: 
- return 2 * number provided, unless the number is a double number. 
- input: integer
- output: integer 
- rules: 
        - double number is repeating substring.. left side and right side same 
          - 123123 is double number
          - 432234 is not double number 
        - if input integer is not double number, multiply by 2 and return
        - if input integer is double number, return number 
d: 
- integer -- something -- integer 

a: 
- check if the number is a double number 
  - must be even number of digits 
  - cut integer in half, compare digits 
    - if same, is double number.. return it.
  else, multiply by 2 and return
  
c: 
=end
# def double_number?(int)
#   str_digits = int.to_s
  
#   if str_digits.length.even?
#     half_str = str_digits.slice!(0, str_digits.length / 2)
#     half_str == str_digits
#   else 
#     false 
#   end 
# end 
    
# def twice(int)
#   double_number?(int) ? int : int * 2
# end 
  
# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10


=begin

Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

input: integer (pos or neg)
output: integer
rules: 
      - if input number is greater than zero, return negative of that number
      - if input is 0 or less than 0, return that number as is.

a: 
  check if number is greater than 0
    - if so, return -(num)
    - if not, return num 
=end 

=begin

Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.



def uppercase?(str)
  str == str.upcase ? true : false 
end 

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
=end
=begin
Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

input: str
output: arr
rules: 
  - array should contain every word in the string 
  - array should contain each word followed by space and integer (num of chars in word)
  - empty str returns empty arr 
  
a: 
- split string into array of words
- iterate through each word in the array 
- append a space, and integer (chars in word) to each element 
- return new array 

def word_lengths(str)
  word_array = str.split
  
  result = word_array.map do |word|
    "#{word} #{word.length}"
  end 
  p result
end 

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
=end

# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

# swap_name('Joe Roberts') == 'Roberts, Joe'

# - a: 
# split name into array of first and last name 
# return string with arr -1 , arr[0]
 
# def swap_name(name)
#   first_last = name.split
#   "#{first_last[-1]}, #{first_last[0]}"
# end 

# p swap_name('Joe Roberts') == 'Roberts, Joe'

=begin

Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
p: 
- input: two integers
- output: array 
- rules:
        - first argument is number of elements in returned array 
        - second argument is starting element, and subsequent elements are multiples
        - if count is 0 (first arg) empty arr should be returned
a; 
- intit empty array 
- add first element to array (second arg)
- count -1 times add next multiple to array 
  - arr << arr[-1] + num 
return array 
=end

# def sequence(count, start_num)
#   results = []
#   num = start_num
  
#   count.times do 
#     results << num
#     num += start_num 
#   end 
# results
# end 



# def sequence(count, num)
#   (1..count).inject([]) { |arr, value| arr << num * value }
# end 

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

=begin

Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'
Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

p: input: three integers
   output: string (letter grade)
   rules: dtermine average of three integers
          output resulting letter grade 

a: 
- calculate average of three input integers 
- check which range average falls into 
- output corresponding letter grade
=end
# require 'pry'
# def get_grade(num1, num2, num3)
#   average = (num1 + num2 + num3) / 3

#   case average
#     when (100..) then "A+"
#     when (90..100) then "A"
#     when (80..89) then "B"
#     when (70..79) then "C"
#     when (60..69) then "D"
#     when (0..59) then "F"
#   end 
# end 

# # p get_grade(95, 90, 93) == "A"
# # p get_grade(50, 50, 95) == "D"
# p get_grade(100, 101, 109) == "A+"


# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]
  
# def buy_fruit(arr)
#   list = []
  
#   arr.each do |sub_arr|
#     sub_arr[-1].times do 
#       list << sub_arr[0]
#     end 
#   end 
#   list 
# end 

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]
  
# def compact_list(arr)
#   list = []
  
#   arr.each do |item|
#     list << [item, arr.count(item)]
#   end 
#   p list
# end 

# compact_list(["apples", "apples", "apples", "orange", "bananas","bananas"])

=begin

Given the array...

Copy Code
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

Copy Code
["demo", "dome", "mode"]
["neon", "none"]
#(etc)

p:
input: array of strings
output: arrays of anagram words- one on each line
rules: 
    - create separate arrays for each group of anagrams

a:
- create sub-arrays of anagram words
  - iterate through words
    - start with first word..current_word
      - sort letters alphabetically 
      - iterate through subsequent words 
        - sort chars in each word and check for matches. 
        
        
=end 

# def get_sorted_annagrams(arr)
#   annagram_key = []
  
#   arr.each do |word|
#     annagram_key << word.chars.sort.join 
#   end 

#   annagram_key.delete_if { |word| annagram_key.count(word) < 2 } 

#   annagram_key.uniq
# end 

# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon', 'fleas']
          

# def anagrams(arr)
#   sorted_key = get_sorted_annagrams(arr)
#   annagram_list = []
  
#   sorted_key.each do |key|
#     current_anagrams = []
#     arr.each do |word|
#       if key == word.chars.sort.join
#         current_anagrams << word 
#       end 
#     end 
#     annagram_list << current_anagrams
#   end 
  
#   annagram_list.each { |list| p list }
# end 

# anagrams(words)



# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:


# The tests above should print "true".

=begin

p: 
input: array of integers 
output: array of integers
rules: 
      - create a new array in which elements are number of integers smaller than each integer in the input array 
      - only count unique values when determining number of integers smaller than current
      - returned array will be in order of each integer in input array 
      - if none smaller than current integer, return 0 for that index 
      - returned array will be same size as input array
d:
- input: array 

- output: array

a:

- initialize unique element array 
- iterate through input array
- check how many elements of the unique element array are smaller
- push the count to results array 
- once iteration is complete
  - return results 
=end

# def smaller_numbers_than_current(array)
#   unique_arr = array.uniq 
  
#   array.map do |num|
#     unique_arr.count { |element| element < num } 
#   end 
# end 
  
# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]


# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:


# The tests above should print "true".

=begin

p:
input: array of integers
output: single integer or nil 
rules: 
      - return minimum sum of 5 consecutive integers as they appear in the input array 
      - minimum sum is smallest possible sum of 5 consecutive integers
      - if input array is smaller than 5 elements, return nil 

d: 
array... subarrays.... integer(sum)

a: 
- create sub arrays each containing 5 integers 
  - iterate through input array 
    - from 0 up to array size - 5
  - push first 5 integers to sub_array

- iterate through sub_arrays
  - sum each sub_array
    - save sum to local variable on first iteration
  - for each subsequent iteration
    - sum sub_array
    - compare to current_sum.. if lower, save as new current_sum 
- once iteration complete, return current sum 



=end 

# def find_sub_arrays(arr)
#   sub_arrays = []
  
#   0.upto(arr.size - 5) do |start_index|
#     sub_arrays << arr[start_index, 5]
#   end 
  
#   sub_arrays
# end 

# def minimum_sum(arr)
#   sub_arrays = find_sub_arrays(arr)
  
  
# end 




# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10


=begin

Hi, everyone. 

I am working on a problem in which I would like to find the minimum sum of several sub arrays. The way I initially thought to solve it was to iterate through each sub array and save the sum to local variable `current_minimum_sum` if it is lower. I'm wondering if there is a way to set up an initial value for `current_minimum_sum` so that the sum of the first sub array is assigned to `current_minimum_sum` as a starting point to compare subsequent sums from the other sub arrays. 

I cannot use `0` as a starting value as sums may be negative. 


Here's some code for clarity. 

```ruby 

sub_arrays = [[1, 2, 3], [1, 9, -10], [0, 5, 9]]

current_minimum_sum = ?  

sub_arrays.each do |sub_arr|
  if sub_arr.sum < current_minimum_sum   
    current_minimum_sum = sub_arr.sum     
  end                                      

p current_minimum_sum 

```

I realize there are other, possibly better, ways to compute the minimum sum, but this problem brought up the question for me. Thanks for any insight!

=end

# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:



# The tests above should print "true".


=begin

p 

input: string
output: new string 
rules: 
      - returned string should contain same words with:
        - every second character..every other char.. in every third word, converted to upcase
      - first upcased char will be the second char of the third word in the string
      - if already upcased, leave alone
questions: 
    - words delimited by spaces?
    - what if target char is a number or punctuation?

e:
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
  
  
d: 
string... array of words... string 

a:
- split string into array of words 
- initialize an empty array to push words to
- set first target word index to 2.
- iterate through words array by index
  - check if index of word is target index..
    if not, push word to results array 
  - if is target index
    - split word into chars 
    - iterate through chars by index 
    - if index of char is odd?, upcase char 
    - join chars back to word and push to results array 
- increment target word index by 3 
  - repeat. 

=end 

# def to_weird_case(str)
#   words_array = str.split 
#   result_arr = []
  
#   target_word_index = 2 
  
#   words_array.map.with_index do |word, index|
#     if index == target_word_index 
#     result_arr << word.chars.map.with_index { |char, idx| idx.odd? ? char.upcase : char }.join 
#     target_word_index += 3
#     else 
#       result_arr << word 
#     end 
#   end 
#   result_arr.join(' ')
# end 
   


# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'




=begin

There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:
1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions
1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation



p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'

=end

=begin

A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.


p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

=end



# def two_sum(numbers, target)
#   iteration_count = 0

#   numbers.each_with_index do |num1, idx1|
#     numbers[idx1 + 1..-1].each_with_index do |num2, idx2|
#       if num1 + num2 == target
#         return [idx1, idx2 + iteration_count + 1]
#       end
#     end
#     iteration_count += 1
#   end
# end

# p two_sum([1, 2, 3], 4) == [0, 2]
# p two_sum([1234, 5678, 9012], 14690) == [1, 2]
# p two_sum([2, 2, 3], 4) == [0, 1]



=begin
Two Sum
Write a function that takes an array of numbers (integers for the tests) and a target number. It should find two different items in the array that, when added together, give the target value. The indices of these items should then be returned in a tuple / list (depending on your language) like so: (index1, index2).

For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers; target will always be the sum of two different items from that array).

Based on: http://oj.leetcode.com/problems/two-sum/

two_sum([1, 2, 3], 4) == {0, 2}

Examples:
two_sum([1, 2, 3], 4) == [0, 2]
two_sum([1234, 5678, 9012], 14690) == [1, 2]
two_sum([2, 2, 3], 4) == [0, 1]
=end

=begin
p
- input: array and an integer 
- output: two element array 
- rules: 
        - returned array will contain two indexes from input array 
        - two numbers in the input array that sum to the target number (second argument)
        - two numbers in the input array will always sum to target number 
d: 
array and integer ... subarrays... array 

a: 
- iterate through the input array 
  - create sub arrays of each two element combination 

- iterate through the subarrays 
  - sum each sub_array
    - if sum == target number.. return that sub_array 

- once sub_array is identified
  - check index of each element within the input array 
  - return array that includes both indeces 

=end 

# def get_sub_arrays(arr)
#   sub_arrays = arr.combination(2).to_a
#   sub_arrays
# end 

# def two_sum(arr, target)
#   sub_arrays = get_sub_arrays(arr)
#   target_sub_arr = nil

#   sub_arrays.each do |sub_arr|
#     if sub_arr.sum == target 
#       target_sub_arr = sub_arr
#     end 
#   end 
  

#   first = arr.index(target_sub_arr[0])
#   arr[first] = 'x'
#   second = arr.index(target_sub_arr[1])

#   [first, second] 

# end 

=begin

Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most
occurring words, in descending order of the number of occurrences.

Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)

Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily.
If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty
array if a text contains no words.

Examples:
top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]
top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]
top_3_words(" //wont won't won't")
# => ["won't", "wont"]
Bonus points (not really, but just for fun):
Avoid creating an array whose memory footprint is roughly as big as the input text.
Avoid sorting the entire array of unique words.


p top_3_words("a a a b c c d d d d e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words(" //wont won't won't ") == ["won't", "wont"]
p top_3_words(" , e .. ") == ["e"]
p top_3_words(" ... ") == []
p top_3_words(" ' ") == []
p top_3_words(" ''' ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]

p: input: string 
   output: array 
   rules: 
          - array should include top 3 most occuring words in the input string 
          - words in returned array should appear in descending order based on count 
          - string may contain punctuation
          - word may contain apostrophe
          - punctuation should not be counted as word 
          - case insensitive ** when determining count of occurances
          
          - if input string contains less than 3 unique words 
            - return most often occuring two or one word 
          - if input string contains no words return empty array 
          - empty string returns empty array 
          - punctuation does not count as a word, but may be included in word 
          - returned array should contain downcased words only
          - spaces don't count as words 
          
e: 
p top_3_words("a a a b c c d d d d e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words(" //wont won't won't ") == ["won't", "wont"]
p top_3_words(" , e .. ") == ["e"]
p top_3_words(" ... ") == []
p top_3_words(" ' ") == []
p top_3_words(" ''' ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]


d: 
string... array of eligible words 
            - must contain 'a-z' case insensitive
            - may contain apostrophe 
            - don't include other punctuation or spaces 
            ex. "hello, what's your, name" == ['hello', "what's", 'your', 'name']
            
...  hash to store counts of each word 

... array will consist of hash keys with highest values in descending order. 

str = "I like: things like I lik'e"  === ['I', 'like:', 'things' 'like', 'I', lik'e]


a:
- create an array of eligible words 
  - contain only words that include (a-z)

- iterate through the eligible words array
  - build hash with each word as key, and count in the array as value 
  
- select the three highest values in the hash. save to local variable array

- iterate through selected values, return associated keys. 

- return array containing three keys with largest value 

=end 
# require 'pry'
# def get_eligible_words(str)
#   words_array = str.split 
  
#   words_array.each do |word|
#     word.delete!("^'a-z")
#   end 
  
#   words_array.select do |word|
#     word.chars.any? { |char| ('a'..'z').include?(char.downcase) }
#   end 
# end 

# def get_word_count_hash(arr)
#   arr.each_with_object({}) do |word, hash|
#     hash[word] = arr.count(word)
#   end 
# end 

# def top_3_words(str)

#   str = str.downcase
#   results = []

#   eligible_words_arr = get_eligible_words(str)

#   word_count_hash = get_word_count_hash(eligible_words_arr)
  
#   highest_values = word_count_hash.values.max(3)
  
#   highest_values.each do |value| 
#     results << word_count_hash.key(value)
#     word_count_hash.delete(results[-1])
#   end 

#   results
# end 

  


# p top_3_words("a a a b c c d d d d e e e e e") == ["e", "d", "a"]
# p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
# p top_3_words(" //wont won't won't ") == ["won't", "wont"]
# p top_3_words(" , e .. ") == ["e"]
# p top_3_words(" ... ") == []
# p top_3_words(" ' ") == []
# p top_3_words(" ''' ") == []
# p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]




# def max_sequence(arr)
#   if arr.all? { |num| num < 0 } || arr.empty?
#     return 0 
#   end 
  
#   sub_arrays = []
  
#   0.upto(arr.size - 1) do |start_index|
#     start_index.upto(arr.size - 1) do |end_index|
#       sub_arrays << arr[start_index..end_index]
#     end 
#   end 
  
#   sub_arrays.map(&:sum).max 
# end

=begin
Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.

Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.

solve("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
solve("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
solve("") ==  ""

p:
- input: string
- output: string 
- goal: return string with each word sorted in the order of the number included in the word. 

- rules:  
        - each word will contain one number 
        - number in each word represents its position in the returned string 
        - numbers may be from 1 to 9... first word should include 1... second word include 2 ... 
        - words in the input only contain valid, consecutive integers 
        
        - returned string should include word as is, with number included
        - empty str returns empty string 
        
- questions: 
            - can a number exist more than once in the string?
            - will each string include the number 1? 
            - is returned string a new string or mutated?
            
e: 
solve("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
solve("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
solve("") ==  ""

d: 
string... array ... string

a: 

1. break string into array of words, iterate through the words by index, for each iteration check if the word includes index + 1? if so, move the word to results array. join results

- break string into an array of words
- initialize a results array to pass words to
- iterate through the array of words with index
  - start iteration...
    - check if current word includes (index + 1).to_s 
      - if so, add 
      
      
2. move all of the numbers to the end of the 


    
def order(str)
  str_arr = str.split
  results = []
  start_index = 1
  
  loop do 
    str_arr.each do |word|
      if word.include?(start_index.to_s)
        results << word 
      end 
    end 
    start_index += 1
    break if results.size == str_arr.size 
  end 
 results.join(' ')
end 

p solve("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p solve("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p solve("") ==  ""
=end   

=begin

Create a function that takes an input String and returns a String, where all the uppercase words of the input String are in front and all the lowercase words at the end. The order of the uppercase and lowercase words should be the order in which they occur.

If a word starts with a number or special character, skip the word and leave it out of the result.

Input String will not be empty.

capitals_first("hey You, Sort me Already!") == "You, Sort Already! hey me"



def capitals_first(str)
  str_arr = str.split 
  uppercase = []
  lowercase = []
  
  str_arr.each do |word|
    if !('a'..'z').include?(word[0].downcase)
      next
    elsif word[0] == word[0].upcase 
      uppercase << word 
    elsif word[0] == word[0].downcase 
      lowercase << word 
    end 
  end 
  (uppercase + lowercase).join(' ')
end 

capitals_first("hey You, $hi Sort me Already!")
  
=end 


=begin

Given a string and an array of integers representing indices, capitalize all letters at the given indices.

For example:

capitalize("abcdef",[1,2,5]) = "aBCdeF"
capitalize("abcdef",[1,2,5,100]) = "aBCdeF". There is no index 100.
The input will be a lowercase string with no spaces and an array of digits.

p: input-  string and array of integers
   output: string 
   goal: return string with certain characters capitalized based on index. input array supplies index location of characters to be capitalized. 
   
   rules: 
        - letters in input string at given indexes (within array) should be capitalized 
        - input string will be all lowercase letters
        - input string will not contain spaces 
        - input array will contain digits
        - if index does not exist in string, disregard index. 
        
      questions: 
                - could string contain non-alphabetic chars.. punctuation, numbers, special chars 
                
e: 
capitalize("abcdef",[1,2,5]) = "aBCdeF"
capitalize("abcdef",[1,2,5,100]) = "aBCdeF". There is no index 100.

d: 
- string, array ....  array       ..... string 

reqs:
  - iterate through input string
  - need access to indexes of chars in string 

a: 
- break string into an array of characters
- initalize an empty results array 
- iterate through the characters array by index
  - for each char
    - check if the index of that char is inlcuded in the input array 
      - if not, add char to results 
      - if so, convert to uppercase, add to results
  - continue iteration until reach end of the character array 
- join the results array back to string
- return string. 

c:
 

def capitalize(str, arr)
  char_array = str.chars 
  results = []
  
  char_array.each_with_index do |char, index|
    arr.include?(index) ? results << char.upcase : results << char 
  end 
  
  results.join 
end 

p capitalize("abcdef",[1,2,5]) == "aBCdeF"
p capitalize("abcdef",[1,2,5,100]) == "aBCdeF"
=end

=begin

Take a look to the kata Maximum Subarray Sum https://www.codewars.com/kata/maximum-subarray-sum In that kata (if you solved it), you had to give the maximum value of the elements of all the subarrays.

In this kata, we have a similar task but you have to find the sub-array or sub-arrays having this maximum value for their corresponding sums of elements. The wanted function: Python and Ruby: find_subarr_maxsum()// Javascript: findSubarrMaxSum()

find_subarr_maxsum([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == [[4, -1, 2, 1], 6]
If in the solution we have two or more arrays having the maximum sum value, the result will have an array of arrays in the corresponding order of the array, from left to right.

find_subarr_maxsum([4, -1, 2, 1, -40, 1, 2, -1, 4]) == [[[4, -1, 2, 1], [1, 2, -1, 4]], 6]  # From left to right [4, -1, 2, 1] appears in the array before than [1, 2, -1, 4].

If the array does not have any sub-array with a positive sum of its terms, the function will return [[], 0].

p (find_subarr_maxsum([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == [[4, -1, 2, 1], 6])
p (find_subarr_maxsum([4, -1, 2, 1, -40, 1, 2, -1, 4]) == [[[4, -1, 2, 1], [1, 2, -1, 4]], 6])
p (find_subarr_maxsum([-4, -1, -2, -1, -40, -1, -2, -1, -4]) == [[], 0])
p (find_subarr_maxsum([2, 1, 3, 4, 1, 2, 1, 5, 4]) == [[2, 1, 3, 4, 1, 2, 1, 5, 4], 23])

p: 
- input: array 
- output: array and integer 
- goal: find subarray(s) that have maximum sum value 


=begin

You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)

the first letter is replaced by its character code (e.g. H becomes 72)

Note: there are no special characters used, only letters and spaces
Examples

decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"


p: 
- input: string
- output: string 
- goal: return decoded string based on criteria.

- rules: 
        - input string: 
          - each word: 
            - second and last char are switched. 
            - first char is its ASCII value 
        - input str is made up of only letters and spaces. 
        - word may only consist of ascii value.. if only one char. 
        - if word only contains ascii num and one char, only two char in word. 
        - only need to swap second and last char if 3 letters in word or more. 
e: 
p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

d: 
string.... arrays ... string 

needs: 
      - access each word in the string 
      - access each char in each word in the string 
      - for numbers in the string 
          - way to separate number at the beinning of the word, from rest of the chars in word 
          - keep number digits together.. not split into individual digits 
  
  "65 119esi 111dl"
  
  ['65', '119esi', 111dl] .... [['65'], ['119', 'esi'], ['111', 'dl']]

        
a: 
- split string into array of words 
- break each word into subarrays 
  - number as first element, letters as second element. 
- iterate through subarrays 
  - convert first element to char equivalent
  - swap first and last char in seccond element 
  - join subarray 
  - add to results array 
- continue until reach end of array of words 
- join results array with spaces, and return it


  
=end 

# def decipher_this(str)
#   words_arr = str.split 
#   sub_arrays = create_subarrays(words_arr)
#   results = []
  
#   sub_arrays.each do |subarr| 
#     words_in_progress = []
#     if subarr.size == 1
#       results << subarr[0]
#     else subarr.each_with_index do |element, idx|
#       if idx == 0 
#         words_in_progress << element.to_i.chr
#       else 
#         element[0], element[-1] = element[-1], element[0]
#         words_in_progress << element
#       end 
#     end 
#     results << words_in_progress.join
#     end 
#   end 
#   results.join(' ')
# end 
      
      
        


# def create_subarrays(arr)
#   subs = arr.map do |word|
#     first_letter_index = word.index(/[a-zA-Z]/)
#     if first_letter_index.nil?
#       [word.to_i.chr]
#     else 
#       [word[0..first_letter_index - 1], word[first_letter_index..-1]]
#     end 
#   end 
#   subs
# end 

# def decipher_this(str)
#   str = str.split
  
#   str.map do |word|
#     ascii_value = word.scan(/[0-9]/).join 
#     word.gsub!(ascii_value, ascii_value.to_i.chr)
    
#     word[1], word[-1] = word[-1], word[1] if word.size > 2
#     word 
#   end.join(' ')
# end 



# p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
# p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
# p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
# p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
# p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"


=begin

#Find the missing letter

Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the
array.
You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always
be at least 2.
The array will always contain letters in only one case.
Example:
['a','b','c','d','f'] -> 'e' 
['O','Q','R','S'] -> 'P'
["a","b","c","d","f"] -> "e"
["O","Q","R","S"] -> "P"
(Use the English alphabet with 26 letters!)


p: 
- input: array 
- output: str
- goal: find missing letter in the sequence given in the array 
- rules: 
        - input arr will contain consecutive increasing letters (a..b...c...)
        - array will be missing one letter in the sequence 
        - arr length will alway be at least 2. ['a', 'c'] --- 'b'
        - array letters will be all upper or all lower cased . 
        - letters will be in order.. alphabetically 
        
        - missing char will never be the first or last char 
        
e: 
p find_missing(["a","b","c","d","f"]) == "e"
p find_missing(["O","Q","R","S"]) == "P"        

d: 
array of individual string characters 

additional array (key of letters in range)

return single char str

a: 
- check case of input array 
- create an array ranging from first char to last (depending on case)
- check key array to see which char in the input array is missing 
- return that char 

=end 

# def find_missing_letter(arr)
#   alphabet_range = arr[0] == arr[0].upcase ? (arr[0]..arr[-1]).to_a : (arr[0]..arr[-1]).to_a
  
#   alphabet_range.difference(arr).join
# end 

# p find_missing_letter(["a","b","c","d","f"]) == "e"
# p find_missing_letter(["O","Q","R","S"]) == "P"       


=begin

You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is
either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. 

Write a method that takes the array as an argument and returns this "outlier" N.

Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)
=end

=begin
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The
quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.


p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false


p: 
-input: string 
- output: boolean
- goal: return true if string contains all letters of alphabet a-z

-rules: 
        - case insensitive
        - ignore numbers and punctuation
        - if string contains all letters from a-z, return true
        
d: 
string.... 

hash - alphabet char, true false 

..boolean

1. create alphabet hash.. letter as key, value as false
   iterate through string 
   for each char, if char present in alphabet hash, change value to true
   once iteration is complete through string, 
   check if all values in alphabet hash are true

2. create alphabet array 
   iterate through char of string
   check if char is present in alphabet array,
    if so, delete it from alphabet array 
    once iteration complete, check if alphabet array is empty?
    if empty return true, else false 

a: 
- create alphabet array with characters a-z
- break string into array of characters 
- iterate through characters 
  - check if char is present in alphabet array
    - if so, delete char from alphabet array 
    - if not, next char 
- continue through each char in character array 
- check if alphabet array is empty. 
  - if so, return true
  - if not return false 
  



def panagram?(str)
  alphabet_arr = ('a'..'z').to_a
  str = str.downcase.chars.uniq 
  
  str.each do |char|
    if alphabet_arr.include?(char)
      alphabet_arr.delete(char)
    end 
  end 
  p alphabet_arr
  alphabet_arr.empty?
end 

# p panagram?("The quick brown fox jumps over the lazy dog.") == true
# p panagram?("This is not a pangram.") == false
p panagram?('Cwm fjord bank glyphs vext quiz') 
=end







=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:
the returned string should only contain lowercase letters

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

p: 
-in: string
-out: string
-goal: convert camel case string to kebab case.. single dash between words
- rules: 
        - camel case begins with lowercase letter
        - camel case capitalizes first letter of new word 
        - camel case includes no spaces 
        
        - kebab case inserts '-' between words at location before capitalized char in camel case to separate words
        - kebab case does not include numbers or punctuation
        - returned string should contain only lowercase letters
e: 
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

d: 
string (camel case).... 

array 

.. string in kebab case

needs: 
      - find location of capital letters in string 
      - insert '-' before each capital letter 
      - convert capital letters to lowercase 
      - remove non (a-z) characters 
      
1. break string into array of characters 
   iterate through each character by index 
   check each char.. if lowercase, add to results array 
    - if uppercase add "-" to results array, then downcased char. 
    - if non-alphabetic, skip to next char 
  - join results array 
  
a: 
- break string into array of characters 
- iterate through each character 
  -check char
    - if non-alphabetic, next 
    - if lowercase.. add to results arr
    - if uppercase, add '-' and downcased char to results array 
- continue until reach end of char array
- join results array back to string 
- return string 

c:
=end

# def kebabize(str)
#   if str.downcase == str
#     return str
#   end 
  
#   char_arr = str.chars 
#   results = []
  
#   char_arr.each do |char|
#     if char.match?(/[a-zA-Z]/) && char.downcase == char 
#       results << char 
#     elsif char.match?(/[a-zA-Z]/) && char.upcase == char 
#       results << "-" << char.downcase 
#     end 
#   end 
#   results.shift if results[0] == '-'
#   results.join
# end 



# p kebabize('QbYk')
# p kebabize('myCamelCasedString') == 'my-camel-cased-string'
# p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

=begin


Let's assume that a song consists of some number of words (that don't contain WUB). To make the dubstep remix of
this song, Polycarpus inserts a certain number of words "WUB" before the first word of the song (the number may be
zero), after the last word (the number may be zero), and between words (at least one between any pair of neighbouring
words), and then the boy glues together all the words, including "WUB", in one string and plays the song at the club.


For example, a song with words "I AM X" can transform into a dubstep remix as "WUBWUBIWUBAMWUBWUBX" and
cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into modern music, he decided to find out
what was the initial song that Polycarpus remixed. Help Jonny restore the original song.

Input
The input consists of a single non-empty string, consisting only of uppercase English letters, the string's length doesn't
exceed 200 characters

Output
Return the words of the initial song that Polycarpus used to make a dubsteb remix. Separate the words with a space.
Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") => WE ARE THE
CHAMPIONS MY FRIEND
=end

=begin

You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an
appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk
Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings
representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction and you know it
takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you
will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point.

Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It
will never give you an empty array (that's not a walk, that's standing still!).
=end


=begin

Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter
words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be
included only when more than one word is present.
Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
=end

# def spinWords(str)
#   words_arr = str.split
  
#   words_arr.map! do |word|
#     if word.length >= 5
#       word.reverse
#     else 
#       word
#     end 
#   end.join(' ')
# end 

# p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
# p spinWords("This is a test") == "This is a test"
# p spinWords("This is another test") == "This is rehtona test"
# p spinWords('test') == 'test'

=begin

Write Number in Expanded Form
You will be given a number and you will need to return it as a string in Expanded Form. For example:
expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'

NOTE: All numbers will be whole numbers greater than 0.
If you liked this kata, check out part 2!!


p: 
-input: integer 
- output: str
- goal: return str with number in expanded form 
- rules:
        - returned string should be broken  into numbers with first number followed by appropriate number of zeros
        134875
        
        100000
         30000
          4000
           800
            70
             5

d: 
integer..

array of strings 

string 

a:
- convert integer to string 
- split string into individual chars (digits)
- init results array
- iterate through each char by index
  - add char at index + '0' for remaining number of chars in array after current char
- join results array with '+' return str

=end 
# require 'pry'
# def expanded_form(int)
#   str_digits_arr = int.to_s.chars 
#   numbers_with_zeros = []
#   results = []
  
#   str_digits_arr.each_with_index do |digit, idx|
#     numbers_with_zeros << digit + ('0' * str_digits_arr[idx + 1..-1].size)
#   end 

#   numbers_with_zeros.each do |element|
#     results << element unless element.chars.all?('0')
#   end 
#     results.join(' + ') 
# end 



# # p expanded_form(12) == '10 + 2'
# # p expanded_form(42) == '40 + 2'
# # p expanded_form(70304) == '70000 + 300 + 4'
# p expanded_form(4002030722)


=begin
In this kata, you have an input string and you should check whether it is a valid message. To decide that, you need to split the string by the numbers, and then compare the numbers with the number of characters in the following substring.

For example "3hey5hello2hi" should be split into 3, hey, 5, hello, 2, hi and the function should return true, because "hey" is 3 characters, "hello" is 5, and "hi" is 2; as the numbers and the character counts match, the result is true.

Notes:

Messages are composed of only letters and digits
Numbers may have multiple digits: e.g. "4code13hellocodewars" is a valid message
Every number must match the number of character in the following substring, otherwise the message is invalid: e.g. "hello5" and "2hi2" are invalid
If the message is an empty string, you should return true

=begin
In this kata, you have an input string and you should check whether it is a valid message. To decide that, you need to split the string by the numbers, and then compare the numbers with the number of characters in the following substring.

For example "3hey5hello2hi" should be split into 3, hey, 5, hello, 2, hi and the function should return true, because "hey" is 3 characters, "hello" is 5, and "hi" is 2; as the numbers and the character counts match, the result is true.

Notes:

Messages are composed of only letters and digits
Numbers may have multiple digits: e.g. "4code13hellocodewars" is a valid message
Every number must match the number of character in the following substring, otherwise the message is invalid: e.g. "hello5" and "2hi2" are invalid
If the message is an empty string, you should return true

p (valid?("3hey5hello2hi") == true
p (valid?("4code13hellocodewars") == true
p (valid?("3hey5hello2hi5") == false
p (valid?("code4hello5") == false
p (valid?("1a2bb3ccc4dddd5eeeee") == true
p (valid?("") == true

p: 
input: string
output: boolean
goal: check if message is valid (if number of letters following number are equal to number value)
rules: 

  - numbers may have multiple digits
  - number of chars following number must be equal to number 
  - string must start with a number to be valid
  - empty string returns empty string 
  
  requirements:
    - same number of numbers and words in string 
    - str must start with a number 
    - str cannot end with a number 
  
e: 
p (valid?("3hey5hello2hi") == true
p (valid?("4code13hellocodewars") == true
p (valid?("3hey5hello2hi5") == false
p (valid?("code4hello5") == false
p (valid?("1a2bb3ccc4dddd5eeeee") == true
p (valid?("") == true

d: 
string... 

array

..boolean
  

a:
- check if str ends in a number 
  - if so, return false 
- check if str starts with a letter 
  - if so, return false
- check if str is empty?
  - if so return true 
  
- break string into two separate arrays, numbers and words 
- check if size of numbers and words array is same. 
  - if not, return false 
  - if so....
  
  - iterate through numbers and words arrays 
  - compare number at first index to size of word at same index 
  - continue through arrays
  - if all numbers and words at same index are same 
    -return true
    -else false

=end

# def valid?(str)
#   return true if str.empty?
#   return false if str[-1].match?(/[0-9]/) || str[0].match?(/[A-Za-z]/)
  
#   numbers = str.scan(/[0-9]+/)
#   words = str.scan(/[A-Za-z]+/)
  
#   return false if numbers.size != words.size 
  
#   booleans = numbers.map.with_index do |num, idx|
#     num.to_i == words[idx].size 
#   end 

#   booleans.all?
# end 
# require 'pry'
# def valid?(str)
#   return true if str.empty?
#   return false if str[-1].match?(/[0-9]/) || str[0].match?(/[A-Za-z]/)
  
#   numbers = str.scan(/[0-9]+/)
#   words = str.scan(/[A-Za-z]+/)
  
#   return false if numbers.size != words.size 
  
#   index = 0
#   bools = []
  
#   loop do 
#     if  numbers[index].to_i == words[index].size
#       bools << true 
#     else 
#       bools << false 
#     end 
#     index += 1
#     break if index > numbers.size - 1
#   end 

#   bools.all?
# end 

# p valid?("3hey5hello2hi") == true
# p valid?("4code13hellocodewars") == true
# p valid?("3hey5hello2hi5") == false
# p valid?("code4hello5") == false
# p valid?("1a2bb3ccc4dddd5eeeee") == true
# p valid?("") == true


# reverse array without using Array#reverse


=begin 
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
=end 
# require 'pry'
# string = "launchschool"

# # convert to uppercase every unique character in the string if it is the second to last occurence of that character. if there is only one of that character, leave alone. 
# # new_str = ''
# # seen = []

# # def cap_second_to_last(string)
# #   string.chars.reverse_each do |char|
# #     if seen.count(char) == 0 
# #       new_str << char 
# #     elsif seen.count(char) == 1
# #       new_str << char.upcase
# #     else 
# #       new_str << char 
# #     end 
# #     seen << char 
# # end 
# # p new_str.reverse!


# # str = 'launchschool'
# # seen = []
# # new_str = ''

# # reversed_chars = str.reverse.chars 

# # reversed_chars.each do |char|
# #   if seen.count(char) == 1
# #     new_str << char.upcase
# #     seen << char 
# #   elsif seen.count(char) == 0 || seen.count(char) > 1 
# #     new_str << char
# #     seen << char 
# #   end 
# # end 

# # p new_str.reverse
    
# def to_camel_case(str)
#   p str.split(/[-_]/)
#   words = str.scan(/[a-zA-Z]+/)
  
#   words.map.with_index do |word, idx|
#     idx == 0 ? word : word.capitalize 
#   end.join
# end 

      

# p to_camel_case('') == ''
# p to_camel_case("the_stealth_warrior") == "theStealthWarrior"
# p to_camel_case("The-Stealth-Warrior") == "TheStealthWarrior"
# p to_camel_case("A-B-C") == "ABC"

=begin

Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.


hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

input: hash
output: array
goal: return array with elements being colors of fruits and sizes of vegetables. 
rules:
      - sizes of vegetables should be all uppercase
      - colors of fruits should be capitalized. 
      - may be nested array if element is an array 

d: 
hash...                 array

needs: 
- if fruit, need colors
- if vegetable, need sizes
- capitalize colors
- upcase sizes 
-return array 

a: 

iterate through each hash key
check if type is fruit or vegetable
  - if fruit
  - add colors to array.. capitalized
  - if vegetable 
    - add size to array, all upcase
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

require 'pry'
def colors_sizes(hash)
  arr = []
  
  hash.each do |product, details|
    if details[:type] == 'fruit'
      arr << details[:colors].map(&:capitalize)
    else arr << details[:size].upcase
    end 
  end 
  arr
end
    
p colors_sizes(hsh)
=end 




=begin
Complete the method that takes a hash/object/directory/association list of users, and find the nexus: the user whose
rank is the closest is equal to his honor. 

Return the rank of this user. For each user, the key is the rank and the value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who
come closest, return the one with the lowest rank (numeric value). 

The hash will not necessarily contain consecutive
rank numbers; return the best match from the ranks provided.


Example
rank honor
users = { 1 => 93,
10 => 55,
15 => 30,
20 => 19, <--- nexus
23 => 11,
30 => 2 }

p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2

input: hash 
output: integer
goal: return integer key (rank) for hash element that has the closest value to the key. 
rules: 
  - hash will contain key value pairs..
    - key is rank, value is honor
    - return key that has smallest difference between key and value integers 
  - if more than one have same difference
    - return key of lowest
  - will not have consectutive rank numbers in hash 
  
e:
p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2

d: 
hash ....     array          ... key (integer)

need:
- access to keys and values within hash
- compare keys and values difference 
- select keys and values that are closest 

a: 
- iterate through hash 
  - get difference between each key and value in hash 
  - keep hash key(s), that has smallest difference
  - choose smallest key from eligible keys 
  
- init current_smallest difference
  - set equal to difference in first key value pair
- iterate through hash 
  - calculate abs value difference between each key value pair 
  - if difference is == current_smallest or lower, push key to array
- return minimum value from array 

=end 

# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# p: 
# input: integer
# output: integer (next featured number)
# goal: return next number that is an odd multiple of 7 with unique digits 
# rules: 
#       - featured number must be multiple of 7 and 
#         - odd 
#         - unique digits 
#       - returned integer will be greater than input 
#       - if none, return error 

# e: 
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987
# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# d: 
# integer...     array           ...  featured number

# needs: 

# - multiple of 7 
# - odd
# - all unique digits 
# - next greater than input 

# a:
# - create range from input to .. infinity
# - iterate over range 
#   - return num if multiple of 7 and odd and uniq digits 
# - if none exist return error 
#   - if number higher than 9 999 999 999
#     - would have 11 digits.. one would have to repeat 
    
# c: 
# def featured(num)
#   max = 9_999_999_999
#   (num..max).each do |num| 
#     if num % 7 == 0 && num.odd? && num.digits.uniq.size == num.digits.size 
#       return num 
#     end 
    
#     'No next featured number'
# end 

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

#featured(9_999_999_999) # -> There is no possible number that fulfills those requirements


=begin
6 kyu
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even
indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing
just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.
The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are
multiple words. Words will be separated by a single space(' ').
=end





# def get_last_num_from_string(string)
#   integer_strings= ('0'..'9').to_a
#   current_num = ''
#   result = ''
  
#   string.chars.each do |char|
#     if integer_strings.include?(char)
#       current_num << char
#     elsif !integer_strings.include?(char) && current_num != ''
#       result = current_num
#       current_num = ''
#     end
#   end
#   result = current_num if current_num != ''
#   result.to_i
# end


# p get_last_num_from_string("Angular JSLearn AngularJS 1.X100%") 




# def get_last_num_from_string(string)
#   integer_strings= ('0'..'9').to_a
#   current_num = ''
  
#   string.chars.reverse.each do |char|
#     if integer_strings.include?(char)
#       current_num << char
#     else
#       return current_num.reverse.to_i if current_num != ''
#     end
#   end
# end


# p get_last_num_from_string("Angular JSLearn AngularJS 1.X100%") 

# require 'pry'

# string = 'aabbbcddd'

# You are given an array `strarr` of strings and an integer `k`. Your task is to return the first longest string consisting of k consecutive strings taken in the array.
# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 3) == "zoneabigailtheta"


# Find the longest substring in alphabetical order.

# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

# The input will only consist of lowercase characters and will be at least one letter long.

# If there are multiple solutions, return the one that appears first.

=begin

p: 
input: string 
output: substring 
goal: return longest substring from the given string that is in alphabetical order. (a-z)
rules: 
      - input will consist of lowercase characters
      - input will be at least one character long 
      - if multiple longest substrings in alphabetical order, return one that appears first in input.
      - if input string is one char long, return that character 
      - if entire string is in alphabetical order, return whole string  

e: 
longest('asd') == 'as'
longest('nab') == 'ab'
longest('abcdeapbcdef') == 'abcde'
  # occurs first 
longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
longest('asdfbyfgiklag') == 'fgikl'
longest('z') == 'z'
longest('zyba') == 'z'
  # first appearing 

d: 

string...   array of substrings          ... substring 

needs: 
  - create substrings 
  - check if substrings are in alphabetical order 
  - save substrings that are in alphabetical order 
  - 

a: 

1. create all possible substrings from input string 
  - iterate through substrings to create array of alphabetical substrings 
    - check if sorted current_substring == substring 
    - if so, add to array 

    - check if substring is in alphabetical order
      - if so, save it to local variable
      - if not, continue iterating through substrings 
    - iterate through the array of alphabetic substrings 
      - sort them by length 
    - return first substring (longest) 

2. initialize local var current_longest and set to empty string 
initialize local var, result to empty string 
iterate through the input string 
  - iterate from first char until reach char not in alphabetical order 
  - add substring up to last alphabetically ordered char to result 
  - empty current substring
  - continue iterating 
  - repeat. 
  - add next substring if longer than result 
  - return result 


c: 
=end 
=begin
def longest(str)
  substrings = get_substrings(str) 
  
  alphabetic_subs = substrings.select do |substr| 
    substr.chars.sort.join == substr
  end 

  current_longest = ''

  alphabetic_subs.each do |substr| 
    if substr.length > current_longest.length 
      current_longest = substr
    end 
  end 
  
  current_longest 
end 


def get_substrings(str)
  substrings = []

  0.upto(str.length - 1) do |start_index| 
    start_index.upto(str.length - 1) do |end_index| 
      substrings << str[start_index..end_index] 
    end 
  end 

  substrings 
end 


# longest('asd') == 'as'
# longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
# longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# longest('asdfbyfgiklag') == 'fgikl'
# longest('z') == 'z'
# longest('zyba') == 'z'
=end 



# You are given an array `strarr` of strings and an integer `k`. Your task is to return the first longest string consisting of k consecutive strings taken in the array.

# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 3) == "zoneabigailtheta"


=begin 

p: 
input: string, and integer
output: concatenated string 
goal: return string that is two strings from the input array that forms the longest possible string when combined. Return first occurence. 
rules: 
      - returned string should consist of k elements from input array concatenated together
      - return first longest string as appears in input array 
      - strings must be consecutive in input array 

p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 3) == "zoneabigailtheta"


d: 

string, integer ...    array           ....string 

needs: 
  - size of each element in the input string 
  - index location of each element in input string 

 ['zoneabigail', abigailtheta, thetaform, formlibe, libezas 

a: 
- create strings of concatenated consecutive elements from input array
  - initialize empty concat_string local var []
  - iterate from first element, k elements
    - concatenate elements together
    - add to concat_string array 

- iterate through concatenated strings 
  - initialize current longest str
  - check size of each string
    - if longer than current longest, then that string becomes current_longest 
  - return current_longest 




  def longest_consec(arr, int) 
    concat_strings_arr = get_strings(arr, int)

    current_longest = ''
    concat_strings_arr.each do |str| 
      if str.length > current_longest.length 
        current_longest = str
      end 
    end 

    current_longest 
  end 


  def get_strings(arr, int) 
    concat_strs = []

    0.upto(arr.size - int) do |start_index|
      concat_strs << arr[start_index, int]
    end 

    concat_strs.map(&:join) 
  end


p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 3) == "zoneabigailtheta"

=end 







=begin

You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)

the first letter is replaced by its character code (e.g. H becomes 72)

Note: there are no special characters used, only letters and spaces
Examples

decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

=end 
#p valid?("3hey5hello2hi") == true
# p valid?("4code13hellocodewars") == true
# p valid?("3hey5hello2hi5") == false
# p valid?("code4hello5") == false
# p valid?("1a2bb3ccc4dddd5eeeee") == true
# p valid?("") == true





=begin

In this kata, you have an input string and you should check whether it is a valid message. To decide that, you need to split the string by the numbers, and then compare the numbers with the number of characters in the following substring.

For example "3hey5hello2hi" should be split into 3, hey, 5, hello, 2, hi and the function should return true, because "hey" is 3 characters, "hello" is 5, and "hi" is 2; as the numbers and the character counts match, the result is true.

Notes:

Messages are composed of only letters and digits
Numbers may have multiple digits: e.g. "4code13hellocodewars" is a valid message
Every number must match the number of character in the following substring, otherwise the message is invalid: e.g. "hello5" and "2hi2" are invalid
If the message is an empty string, you should return true

p (valid?("3hey5hello2hi") == true
p (valid?("4code13hellocodewars") == true
p (valid?("3hey5hello2hi5") == false
p (valid?("code4hello5") == false
p (valid?("1a2bb3ccc4dddd5eeeee") == true
p (valid?("") == true

=end 

=begin

In this kata, you have an input string and you should check whether it is a valid message. To decide that, you need to split the string by the numbers, and then compare the numbers with the number of characters in the following substring.

For example "3hey5hello2hi" should be split into 3, hey, 5, hello, 2, hi and the function should return true, because "hey" is 3 characters, "hello" is 5, and "hi" is 2; as the numbers and the character counts match, the result is true.

Notes:

Messages are composed of only letters and digits
Numbers may have multiple digits: e.g. "4code13hellocodewars" is a valid message
Every number must match the number of character in the following substring, otherwise the message is invalid: e.g. "hello5" and "2hi2" are invalid
If the message is an empty string, you should return true

p (valid?("3hey5hello2hi") == true
p (valid?("4code13hellocodewars") == true
p (valid?("3hey5hello2hi5") == false
p (valid?("code4hello5") == false
p (valid?("1a2bb3ccc4dddd5eeeee") == true
p (valid?("") == true


P: 
input: string 
output: boolean 
goal: return true if the number of letters following each number in the string are equal in value. 
rules: 
      - only letters and digits in the input string 
      - numbers may have multiple digits 
      - empty string returns true 
      - must begin with digit 
      - cannot end in digit 
e: 

p (valid?("3hey5hello2hi") == true
p (valid?("4code13hellocodewars") == true
p (valid?("3hey5hello2hi5") == false
p (valid?("code4hello5") == false
p (valid?("1a2bb3ccc4dddd5eeeee") == true
p (valid?("") == true      


d: 

string ..     subarrays                ...true or false 

needs: 
  - access to each number in the string 
  - accses to each word in the string 

a: 
- check if string is empty?
  - if so, return true 
  - check if string starts with a digit
    - if not, return false 
- check if string ends in digit 
  - if so, return false 
  
- iterate through input string 
  - save each number to an array 
  - save each word to an array 
- iterate through numbers array by index 
  - compare each number (integer value) to the word at corresponding index in words array (length) 
- if all numbers (integer value) == word.length then return TrueClass
- otherwise false 



=end 

# def valid?(str)
#   return true if str.empty?

#   return false if !str[0].match?(/[0-9]/) || str[-1].match?(/[0-9]/)

#   numbers = str.scan(/[0-9]+/) 
#   words = str.scan(/[a-zA-Z]+/)

#   booleans = []

#   numbers.each_with_index do |num, idx|
#     booleans << num.to_i == words[idx].length 
#   end 

#   booleans.all?
# end 

=begin
def valid?(str) 
  return true if str.empty?
  return false if !str[0].match?(/[0-9]/) || str[-1].match?(/[0-9]/)

  current_num = ''
  current_word = ''
  nums = []
  words = []


  str.each_char do |char|
    if char.match?(/[0-9]/) && current_word.empty?
      current_num << char 
    elsif char.match?(/[a-zA-Z]/) && current_num != ''
      nums << current_num 
      current_num = ''
      current_word << char 
    elsif char.match?(/[a-zA-Z]/) && current_num.empty?
      current_word << char 
    elsif char.match?(/[0-9]/) && current_word != ''
      words << current_word 
      current_word = ''
      current_num << char 
    end 
  end 

  nums << current_num if current_num != ''
  words << current_word if current_word != ''

  nums.all?.with_index do |num|
    

end 


p valid?("3hey5hello2hi") #== true
# p valid?("4code13hellocodewars") == true
# p valid?("3hey5hello2hi5") == false
# p valid?("code4hello5") == false
# p valid?("1a2bb3ccc4dddd5eeeee") == true
# p valid?("") == true

=end 


# require 'pry'
# def to_weird_case(str)
#   word_idx = 0
#   letter_idx = 0

#   str.each_char.with_index do |char, idx|
#     binding.pry
#     if (word_idx + 1) % 3 == 0
#       (str[idx] = char.upcase!) if (letter_idx.odd? && char != ' ')
#     end

#     letter_idx += 1

#     if char == ' '
#       word_idx += 1
#       letter_idx = 0
#     end
#   end
# end

# p to_weird_case('Lorem Ipsum is simply dummy text of the printing')




=begin
Your job is to write a function which increments a string, to create a new string.

If the string already ends with a number, the number should be incremented by 1.
If the string does not end with a number. the number 1 should be appended to the new string.
Examples:

foo -> foo1

foobar23 -> foobar24

foo0042 -> foo0043

foo9 -> foo10

foo099 -> foo100

Attention: If the number has leading zeros the amount of digits should be considered.

p increment_string("foo") == "foo1"
p increment_string("foobar001") == "foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar00") == "foobar01"
p increment_string("foobar99") == "foobar100"
p increment_string("") == "1"

p: 
input: string 
output: new string 
goal: return new string- if input ends in number, increment number by 1, or append 1 to input string. 
rules: 
      - string may or may not end in number
      - if ends in number, increment number by 1 based on its integer value 
      - if empty string, return '1'
      - number may have leading zeros 

e: 
p increment_string("foo") == "foo1"
p increment_string("foobar001") == "foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar00") == "foobar01"
p increment_string("foobar99") == "foobar100"
p increment_string("") == "1"

d: 
string ... 

array (separated alphabetic and numberic values) 

new_string 

a: 
- check if string ends in number
  - if not, append '1' to input string and return it
  - if so, 
    - convert number to integer, increment integer by 1
    - convert integer back to string
    - append number to alphabetic portion of string
  

c: 


def increment_string(input)
  return '1' if input == ''
  if input[-1].match?(/\d/) 
    letters, digits = input.chars.partition { |char| char.match?(/[a-z]/i) }
    letters.join + digits.join.next
  else
    "#{input}1"
  end
end
=end 


# str = "A man, a plan, a canal: Panama"

# def valid_palindrome?(str)
#   str = str.delete('^a-zA-Z')
#   str == str.reverse 
# end

# valid_palindrome?(str)


# Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased and you need to start over for each word.

# The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').


# def weirdcase string
#   word_idx = 0

#   string.each_char.with_index do |char, main_idx|
#     string[main_idx] = word_idx.even? ? char.upcase : char.downcase
#     word_idx = char == ' ' ? 0 : word_idx + 1
#   end
# end




# arr = ('a'..'z').to_a

# def fib_idx(arr)
#   arr.each_with_index do |letter, idx|
#     return letter if is_fib?(idx)
#   end 
# end 

# nums = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181]

# def is_fib?(num)
#   sequence = [1, 1]
  
#   loop do 
#     sequence << (sequence[-2] + sequence[-1])
#     return true if sequence[-1] == num 
#     break if sequence[-1] > num 
#   end 
  
#   false 
# end 
  
# p is_fib?(378)



# def is_pal?(str)
#   reversed_str = ''
  
#   (str.length - 1).downto(0) do |idx|
#     reversed_str << str[idx]
#   end 
  
# p reversed_str
  
  
# end 

# is_pal?('fisherman')



# def collapse(str)
#   new_str = ''
  
#   str.each_char.with_index do |char, idx|
#     new_str << char unless str[idx + 1] == char
#   end 
  
# p  new_str 
  
  
# end 

# # p collapse('bbbbbbbbb') == 'b'
# # p collapse('wwooonndeerrfull woorrlldd') == 'wonderful world'
# # p collapse('222xyzxyzyx') == '2xyzxyzyx'
# # p collapse('Q') == 'Q'
# # p collapse('AAbbCC') == 'AbC'
# # p collapse('') == ''
# p collapse('AaABBb')


# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# Example:

# Copy Code
# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

# def rotate_array(arr)
#   new_arr = []
  
#   new_arr << arr[1..-1] 

  
#   p new_arr.flatten
  
# end 

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']




# Find the longest substring in alphabetical order. 
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt". 
# The input will only consist of lowercase characters and will be at least one letter long. 
# If there are multiple solutions, return the one that appears first. 


=begin

P: 
input: string 
output: substring 
goal: return longest substring that is in alphabetical order from the input string. 
rules: 
      - input will consist of lowercase chars
      - input will be at least one character long
      - if multiple valid substrings occur, return one that appears first in input string 
      - if input string is one char long, return input string
e: 
p longest('asd') == 'as' 
p longest('nab') == 'ab' 
p longest('abcdeapbcdef') == 'abcde' 
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt' 
p longest('asdfbyfgiklag') == 'fgikl' 
p longest('z') == 'z' 
p longest('zyba') == 'z'


d: 
string...                 ... substring 

needs: 
  - substrings from input str
  - way to check if substring is in alphabetical order 
  - way to check the length of each alphabetical substring 
  - if there are multiple substrings that are equal in length and alphabetical, way to check which occurs first. 

a: 
- create all substrings from input string 
  - start iteration from first char
  - save substrings in increasing size to array 
  - return array 
- initialize an empty array to hold alphabetic substrings
- iterate through substrings 
  - check if current_substring is in alphabetical order 
  - if so, move substring to a separate array.
  - if not, continue iterating through end of substrings
- initialize local var longest_substring set to empty string 
- iterate through alphabetic substrings 
  - save substring to longets_substring if length of current_substring is longer than longest. 
- return longest_substring 

c: 
=end 

# def longest(str) 
#   all_substrings = get_subs(str) 
  

#   alphabetic_subs = all_substrings.select do |substr| 
#     substr == substr.chars.sort.join 
#   end 

  
#   alphabetic_subs 


# end 

# def get_subs(str) 
#   substrings = [] 

#   0.upto(str.length - 1) do |start_index|
#     start_index.upto(str.length - 1) do |end_index| 
#       substrings << str[start_index..end_index] 
#     end 
#   end 

#   substrings

# end 




#p longest('asd') #== 'as' 
# p longest('nab') == 'ab' 
# p longest('abcdeapbcdef') == 'abcde' 
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt' 
# p longest('asdfbyfgiklag') == 'fgikl' 
# p longest('z') == 'z' 
# p longest('zyba') == 'z'


# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000. 

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1 # Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2 

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself. 



##Problem
# Input: Integer x
  # Positive
# Output: Integer - number of integers that satisfy between conditions
  # Between 1..x
  # Is odd but is not prime
  # Number 1 is not prime!

# In own words: Taking a range of 1..x, and selecting out the odd numbers, and reject the primes out of that selection

# Questions: 
  # 

##Data Structure
#

##Algorithm
# Set up a range of 1 to x(this is the input)
  # Select odd numbers from that range
  # Now have an array of odd numbers
# Detecting whether each number is prime or not
  # Iterate through odd aray
    # Set up another range
    # Divid by the range .. current num
    # Ex: 15 is prime? 
      # 2..15 Iterate through the range
        # 15 % range != 0 IF it IS prime
  # Put prime numbers into prime number
###### Substract odd number array from my prime num array

# def odd_not_prime(input)
#   odd_array = (1..input).select do |num|
#     num.odd?
#   end

#   odd_array.select do |num|
#     (2..num).all? do |n|
#       num % n == 0
#     end
#   end

# end


# p odd_not_prime(9) #== 3 
# # [1,3,5,7,9,11,13,15]
#   # There are 3 numbers here that are not prime: 1, 9, 15
# # p odd_not_prime(48) == 10 
# # p odd_not_prime(82) == 20



=begin

You are given array of integers, your task will be to count all pairs in that array and return their count.

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)

Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

Examples
[1, 2, 5, 6, 5, 2] --> 2
...because there are 2 pairs: 2 and 5
[1, 2, 2, 20, 6, 20, 2, 6, 2] --> 4
...because there are 4 pairs: 2, 20, 6 and 2 (again)


p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0



def pairs(arr)
  arr.uniq.map { |num| arr.count(num) / 2 }.sum 
end 
=end 

=begin

Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1




# def solution(str, search)
# substrings = []
#   0.upto(str.size - search.size) do |index|
#     substrings << str[index, search.size]
#   end 

#   substrings.count(search) 

# end 


#or 

def solution(str, search)
  str.scan(search).size 
end 


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1


=end







=begin

The vowel substrings in the word codewarriors are o,e,a,i,o. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

=end 

def solve(str)
  str.scan(/[aeiou]+/).max_by { |substr| substr.size }.size 
end 






=begin

Given a string of integers, return the number of odd-numbered substrings that can be formed.
For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.
solve("1341") = 7. See test cases for more examples.

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

def solve(str)
  substrings = []

  0.upto(str.size - 1) do |start|
    start.upto(str.size - 1) do |end_idx|
      substrings << str[start..end_idx]
    end 
  end 
  
  substrings.count { |substr| substr.to_i.odd? } 
end 

=end 







=begin

For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is
equal to t repeated k times. The input string consists of lowercase latin letters. Your function should return a tuple (in
Python) (t, k) or an array (in Ruby and JavaScript) [t, k]

Example #1:
for string
s = "ababab"
the answer is
["ab", 3]

Example #2:
for string
s = "abcde"
the answer is
because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

def f(str)
  substrings = []
  
  1.upto(str.size / 2) do |index| 
    substrings << str[0, index]
  end 

  substrings.each do |substr|
    multiplier = str.size / substr.size
    if substr * multiplier == str
      return [substr, multiplier] 
    end
  end 

  [str, 1]
end 

=end




=begin

A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The
quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

=end








=begin

Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true



def scramble(str1, str2)
  str2.chars.all? do |char|
    str1.count(char) >= str2.count(char)
  end 
end 

=end 







=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.
Note: If the number is a multiple of both 3 and 5, only count it once.

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

def solution(int)
  sum = 0
  (1...int).each do |num|
    (num % 3 == 0 || num % 5 == 0) ? sum += num : num
  end 
  sum 
end 

=end 











=begin

Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:
greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

=end 






=begin

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"ABBA" -> 2 # 'A' and 'B' each occur twice

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

=end 











=begin

Given a List [] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list should equal the closest prime number .

List size is at least 2 .
List's numbers will only have positives (n > 0) .

Repetition of numbers in the list could occur .

The newer list's sum should equal the closest prime number .

Input >> Output Examples

1- minimumNumber ({3,1,2}) ==> return (1)
Explanation:
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime
number is (1) , which will make *the sum of the List** equal the closest prime number (7)* .

2- minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime
number is (5) , which will make *the sum of the List** equal the closest prime number (37)* .

3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime
number is (2) , which will make *the sum of the List** equal the closest prime number (191)* .

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2


def minimum_number(arr)
  original_sum = arr.sum 

  (original_sum..).each do |num| 
    if prime?(num)
      return num - original_sum 
    end 
  end 


end 

def prime?(num)
  return false if num < 2

  2.upto(num - 1) do |divisor| 
    return false if num % divisor == 0 
  end 

  true 

end cd 
=end






=begin

You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:

Let's say you are given the array [1,2,3,4,3,2,1]: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

Another one: 

You are given the array [20,10,-80,10,10,15,35]
At index 0 the left side is []
The right side is [10,-80,10,10,15,35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.



If you are given an array with multiple answers, return the lowest correct index.

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

def find_even_index(arr)
  arr.each_index do |idx|
   return idx if arr[0...idx].sum == arr[idx + 1..-1].sum
 end 
 -1
end 

=end 





=begin
Given an array of integers, find the one that appears an odd number of times.

There will always be only one integer that appears an odd number of times.

Examples
[7] should return 7, because it occurs 1 time (which is odd).
[0] should return 0, because it occurs 1 time (which is odd).
[1,1,2] should return 2, because it occurs 1 time (which is odd).
[0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
[1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
find_it([10]) == 10
find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10

=end 




=begin
There is an array with some numbers. All numbers are equal except for one. Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
It’s guaranteed that array contains at least 3 numbers.

find_uniq([1,1,1,1,0]) == 0
find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

=end 




=begin

Given two arrays a and b write a function comp(a, b) that checks whether the two arrays have the "same" elements,with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

Examples

Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. 

It gets obvious if we write b's elements in terms of squares:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

Invalid arrays
If we change the first number to something else, comp may not return true anymore:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.


Remarks
a or b might be [] (all languages except R, Shell).
a or b might be nil 

If a or b are nil the problem doesn't make sense so return false.


p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false

=end 



=begin
Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * entire pair is earlier, and therefore is the correct answer
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * entire pair is earlier, and therefore is the correct answer
== [3, 7]
Negative numbers and duplicate numbers can and will appear.

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]
=end 




=begin
Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a
hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of
the array, and as values the counting of each value.
Example usage:
input = [1,1,2,2,2,3]
group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:
Array#count
Array#length

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}
=end



=begin
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even
indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing
just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.
The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are
multiple words. Words will be separated by a single space(' ').
 



p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"


def weirdcase(str)
  word_idx = 0 

  str.each_char.with_index do |char, index| 
    if char != ' ' && word_idx.even? 
      str[index] = char.upcase 
      word_idx += 1
    elsif char != ' ' && word_idx.odd?
      str[index] = char.downcase
      word_idx += 1
    else 
      word_idx = 0 
      next 
    end 
    
    
  end 

  str 
end 





=end




=begin 
# The alphabetized kata
# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

# The input is restricted to contain no numerals and only words containing the english alphabet letters.



p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")
== "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabetized("!@$%^&*()_+=-`,"), "")
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

def alphabetized(str)
  str = str.delete('^a-zA-Z0-9')
  str.chars.sort_by { |char| char.downcase }.join
end 
=end 





=begin
In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

p solve(123056,1) == '12056'
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'
=end 





=begin
Given: an array containing hashes of names
Return: a string formatted as a list of names separated by commas except for the last two names, which should be
separated by an ampersand.

Example:
list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'
list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'
list([ {name: 'Bart'} ])
# returns 'Bart'
list([])
# returns ''
Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.


def list(arr)
  new_arr = []

  arr.each do |hash|
    new_arr << hash[:name] 
  end 
  
  case new_arr.size 
  when 1 then new_arr[0]
  when 2 then new_arr[0] + ' & ' + new_arr[1]
  else new_arr[0...-1].join(', ') + ' & ' + new_arr[-1] 
  end 
end 
=end






=begin

Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are
substrings of strings of a2.

#Example 1: a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns ["arp", "live", "strong"]
#Example 2: a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns []


Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
Beware: r must be without duplicates.
Don't mutate the inputs.
=end






=begin

Write a function
triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2. If this isn't the case, return 0


Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and num2 has straight double 99s
triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2


p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1

=end 

=begin
# 3. Given a list of integers, return a list of the same size with the
# integers transformed into the nearest prime number. If the integer is 
# equidistant between two primes, transform the element into the greater
# prime number. 
=end 


=begin 
Create a function that takes a 2D array as an input, and outputs another array that contains the average values for the numbers in the nested arrays at the corresponding indexes.

Note: the function should also work with negative numbers and floats.

p avg_array([[1, 2, 3, 4], [5, 6, 7, 8]]) == [3, 4, 5, 6]
p avg_array([[2, 3, 9, 10, 7], [12, 6, 89, 45, 3], [9, 12, 56, 10, 34], [67, 23, 1, 88, 34]]) == [22.5, 11, 38.75, 38.25, 19.5]
p avg_array([[2, 5, 4, 3, 19],[2, 5, 6, 7, 10]]) == [2, 5, 5, 5, 14.5]






p: 

input: nested array 
output: flat array 
goal: return array where each element is the average of elements at that index fromeach nested array in the input array. 
rules: 
      - nested arrays will all be same size 
      - should work with negative numbers and floats 
      - returned array should be flat 
      

e: 
p avg_array([[1, 2, 3, 4], [5, 6, 7, 8]]) == [3, 4, 5, 6]
p avg_array([[2, 3, 9, 10, 7], [12, 6, 89, 45, 3], [9, 12, 56, 10, 34], [67, 23, 1, 88, 34]]) == [22.5, 11, 38.75, 38.25, 19.5]
p avg_array([[2, 5, 4, 3, 19],[2, 5, 6, 7, 10]]) == [2, 5, 5, 5, 14.5]
=end 


=begin
two sum 

Write a function that takes an array of numbers (integers for the tests) and a target number. It should find two different items in the array that, when added together, give the target value. The indices of these items should then be returned in a tuple / list (depending on your language) like so: (index1, index2).

For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers; target will always be the sum of two different items from that array).

Based on: http://oj.leetcode.com/problems/two-sum/

p two_sum([1, 2, 3], 4) == [0, 2]
p two_sum([1234, 5678, 9012], 14690) == [1, 2])
p two_sum([2, 2, 3], 4) == [0, 1])

to find first occuring two indexes

def two_sum(arr, target)
  hash = {}

  arr.each_with_index do |num, idx| 
  compliment = target - num 
    if hash.key?(compliment)
      return [hash[compliment].min, idx]
    elsif hash.key?(num) 
      hash[num] << idx
    else 
      hash[num] = [idx]
    end 
  end 
  nil 
end 

=end 
# Complete the function that takes a non-negative integer, and returns a list of non-negative integer pairs whose values - when squared - sum to the given integer.

# For example, given the parameter 25, the function should return the two pairs [0, 5] and [3, 4] because 0^2 + 5^2 = 25 and 3^2 + 4^2 = 25.

# Return the pairs in ascending order, so e.g. [[0, 5], [3, 4]] not [[5, 0], [3, 4]] or [[3, 4], [0, 5]], etc.

# If the given value cannot be expressed as the sum of two squares, return an empty array.

# Note: The upper bound of the parameter value will be 2,147,483,647

# Examples
#   0  -->  [ [0, 0] ]
#   1  -->  [ [0, 1] ]
#   2  -->  [ [1, 1] ]
#   3  -->  []
#   4  -->  [ [0, 2] ]
#   5  -->  [ [1, 2] ]
# 25  -->  [ [0, 5], [3, 4] ]
# 325  -->  [ [1, 18], [6, 17], [10, 15] ]
# p all_squared_pairs(0) == [[0, 0.0]]
# p all_squared_pairs(1) == [[0, 1.0]]
# p all_squared_pairs(2) == [[1, 1.0]]
# p all_squared_pairs(3) == []
# p all_squared_pairs(10) == [[1, 3.0]]
# p all_squared_pairs(16) == [[0, 4.0]]
# p all_squared_pairs(20) == [[2, 4.0]]
# p all_squared_pairs(25) == [[0, 5.0], [3, 4.0]]
# p all_squared_pairs(325) == [[1, 18.0], [6, 17.0], [10, 15.0]]

# p all_squared_pairs(71825) == [[1, 268.0], [40, 265.0], [65, 260.0], [76, 257.0], [104, 247.0], [127, 236.0], [160, 215.0], [169, 208.0], [188, 191.0]]

# p all_squared_pairs(1048039120) == [[4824, 32012.0], [5608, 31884.0], [10056, 30772.0], [10808, 30516.0], [14644, 28872.0], [15348, 28504.0], [17928, 26956.0], [18584, 26508.0]]

# p all_squared_pairs(2147483643) == []
# p all_squared_pairs(2147483645) == []
# p all_squared_pairs(2147483647) == []


# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

=begin

p: 
input: string
output: new string 
goal: return string with every other char in every 3rd word converted to uppercase. Other characters should be unchanged. 
rules: 
      - input will be a string
      - return a new string with certain characters converted to uppercase
      - if char at target location is already uppercase, leave as is.
      - if no character exists at target location, return input string. 
      - empty string should return empty string

e: 
# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

d: 
- string...

array

- ...new string 


a: 
- split string into array of words 
- initialize empty string to hold string
- set target word index to 2 
- iterate through array by index
  - first target word will be at index 2
  - second target word will be at index 5 
  - third target word at index 8... etc. 
- if word is at target index
  - split word into characters 
  - iterate through characters by index 
  - convert all odd indexed characters to uppercase 
  - join back to word 
  - add word to new string 
  - increment word index by 3. 
- if word is not at target index
  - add word to new string as is. 
- return new string

c: 


def to_weird_case(str)
  new_str = []
  words_arr = str.split 
  target_word_idx = 2

  words_arr.each_with_index do |word, idx| 
    if idx != target_word_idx
      new_str << word 
    else 
      altered_chars = word.chars.map.with_index do |char, index|
        index.even? ? char : char.upcase 
      end 
      new_str << altered_chars.join
      target_word_idx += 3
    end 
  end 

  new_str.join(' ')
end 




p to_weird_case('Lorem Ipsum is simply dummy text of the printing') =='Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') =='It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') =='Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

=end 








=begin
# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".

p: 
- input: string
- output: string character 
- goal: return character from input string that occurs least often.
- rules: 
        - if multiple chars occur lowest number of times, return one that occurs first in input str
        - case insensitive count
        - returned char should be lowercase
        - may be space or special char


e: 
p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

d: 
string

array 

string char 

a: 
- create array of unique characters from input string
- iterate through the character array 
  - for each char..
    - count number of occurences in input string
    - save current_lowest char
    - save current_lowest count 
  - check if each unique char has lower count than saved value
    - if so, that char becomes lowest char
    - that value becomes lowest count 
  - at end of iteration
    - return lowest char



def least_common_char(str)
  str = str.downcase
  arr = str.chars.uniq
  winning_char = arr[0]
  lowest_count = str.count(arr[0])

  arr.each do |char| 
    if str.count(char) < lowest_count
      winning_char = char 
      lowest_count = str.count(char) 
    else 
      next 
    end 
  end 

  winning_char 


end 

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'
=end











=begin
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

p: 
- input: array of integers
- output: array (two elements from input)
goal: return two element array which contains the two integers from the input array that are closest together in value
rules: 
      - if more than two numbers are equally close, return first occuring 
      - returned array should be in order of appearance


e: 
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

d: 

array... 

subarrays

... two element array 

a: 
- create all two unique two element subarrays from input array
- set current lowest_pair equal to difference in first sub array
- set current_lowest difference to difference in first sub array 
- iterate through subarrays
  - calculate the abs value difference 
  - check if difference is smaller than current lowest diff
    - if so, that sub array becomes lowest pair
    - lowest difference becomes diff of lowest pair
- return lowest pair 

c


def closest_numbers(arr)
  subarrays = find_subarrays(arr)
  closest_pair = subarrays[0] 
  lowest_difference = (subarrays[0][0] - subarrays[0][1]).abs

  subarrays.each do |subarr| 
    if (subarr[0] - subarr[1]).abs < lowest_difference
      closest_pair = subarr
      lowest_difference = (subarr[0] - subarr[1]).abs
    end 
  end 

  closest_pair
end 

def find_subarrays(arr)
  subarrays = []

  0.upto(arr.size - 2) do |start_idx|
    (start_idx + 1).upto(arr.size - 1) do |end_idx|
      subarrays << [arr[start_idx], arr[end_idx]]
    end 
  end 

  subarrays 
end 



  p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
  p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
  p closest_numbers([12, 7, 17]) == [12, 7]
=end

=begin
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

=begin

p: 
input: array
output: integer or nil 
goal: return lowest possible sum of 5 consecutive integers as they appear in input array
rules: 
      - if input has less than 5 integers, return nil 
      - minimum sum is lowest sum of 5 consecutive integers in input arr
      - input array may contain positive or negative integers

e: 
p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

d: 
array... 

subarrays (5 consecutive integers) 

... integer (min sum)

a: 

- create subarrays of 5 consecutive integers 
  - start with first element up to arr size - 5
  - iterate up to 5 elements
  - add 5 elements to subarrays
- set lowest_sum to sum of first sub array 
- iterate through subarrays 
  - calculate sum of each subarray
  - save sum to lowest sum is lower than lowest_sum 
- return lowest_sum 

c: 


def minimum_sum(arr)
  return nil if arr.size < 5

  subarrays = find_subarrays(arr)

  sums = subarrays.map do |subarr| 
    subarr.sum 
  end 

  sums.min
end 

def find_subarrays(arr)
  subarrays = [] 

  0.upto(arr.size - 5) do |start_idx| 
    subarrays << arr[start_idx, 5] 
  end 

  subarrays 
end 

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
=end 



# def sum_pairs(arr, int)
#   potential_subarrays = []

#   0.upto(arr.size - 2) do |first_index|
#     (first_index + 1).upto(arr.size - 1) do |second_index|
#       if arr[first_index] + arr[second_index] == int
#         potential_subarrays << [arr[first_index], arr[second_index], second_index]
#       end 
#     end 
#   end 
#   return nil if potential_subarrays.empty?
  
#   potential_subarrays.sort_by! { |subarr| subarr[2] }
#   potential_subarrays[0].first(2)
# end



# Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

# For example (Input --> Output):

# 39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
# 999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2)
# 4 --> 0 (because 4 is already a one-digit number)

# p persistence(39) == 3
# p persistence(4) == 0
# p persistence(25) == 2
# p persistence(999) == 4
# p persistence(444) == 3

=begin

input: integer 
output: integer (number of times must multiply digits to reach single digit)
goal: return integer equal to number of times you must multiply digits to reach single digit number 
rules: 
      - number may be only one digit long initially
        - if so, return 0 
      - start with multiplying input digits to get product
      - multiply digits of product again... until single digit reached 
      - return number of times digits must be multiplied to reach single digit 

e: 
# p persistence(39) == 3
# p persistence(4) == 0
# p persistence(25) == 2
# p persistence(999) == 4
# p persistence(444) == 3

d: 
integer... 

array to store digits of each integer (product) 

..single integer 

a: 
- split digits into array 
- check size of array 
  - if size == 1 return counter 
- multiply all digits
 
- split current product into array of digits
  - check size of array.. if size == 1, return counter 
  - multiply all digits, save current product 
    - increment counter + 1
  - split current_product into digits arr
  - check size of arr, if size == 1, return counter 
  - repeat until size of arr == 1, then return counter. 

c: 


def persistence(num) 
  current_product = num 
  counter = 0 

  loop do 
    arr = current_product.digits 
    return counter if arr.size == 1

    current_product = arr.inject(:*) 
    counter += 1
  end 
end 

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
p persistence(444) == 3

=end 


=begin
A Narcissistic Number is a positive number which is the sum of its own digits, each raised to the power of the number of digits in a given base. In this Kata, we will restrict ourselves to decimal (base 10).

For example, take 153 (3 digits), which is narcisstic:

    1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
and 1652 (4 digits), which isn't:

    1^4 + 6^4 + 5^4 + 2^4 = 1 + 1296 + 625 + 16 = 1938
The Challenge:

Your code must return true or false (not 'true' and 'false') depending upon whether the given number is a Narcissistic number in base 10. This may be True and False in your language, e.g. PHP.

Error checking for text strings or other invalid inputs is not required, only valid positive non-zero integers will be passed into the function.


p: 
input: integer 
output: boolean
goal: return true if input number is equal to sum of its own digits raised to the power of the number of digits in the input integer. 
rules: 
      - only valid, positive, non-zero input 
      - each digit should be raised to power of number of digits in input Integer
        - 123.... 1**3 + 2**3 + 3**3 = 1 + 8 + 27 = 36 ... return false 

e: 

p narcissistic?(5) == true   
p narcissistic?(153) == true 
p narcissistic?(1633) == false

d: 
integer 

array of digits 

boolean 


a: 
- break integer into array of digits 
- check size of array.. assign to power local var
- iterate over array 
  - transform each digit to digit to power 
  - sum all powers 
- check if sum == input 
  - if so return true, else false 

c: 

 

def narcissistic?(int)
  digits = int.digits 
  power = digits.size 

  sum_of_powers = digits.map do |digit| 
    digit**power 
  end.sum 

  sum_of_powers == int 
end 

p narcissistic?(5) == true   
p narcissistic?(153) == true 
p narcissistic?(1633) == false

=end



=begin 
Write a function that takes a string of parentheses, and determines if the order of the parentheses is valid. The function should return true if the string is valid, and false if it's invalid.

Examples
"()"              =>  true
")(()))"          =>  false
"("               =>  false
"(())((()())())"  =>  true
Constraints
0 <= input.length <= 100

Along with opening (() and closing ()) parenthesis, input may contain any valid ASCII characters. Furthermore, the input string may be empty and/or not contain any parentheses at all. Do not treat other forms of brackets as parentheses (e.g. [], {}, <>).



def valid_parentheses(str)
  counter = 0 
  p str.chars

  str.chars.each do |char| 
    if char == '('
      counter += 1
    elsif char == ')'
      counter -= 1
    end 
    return false if counter < 0 
  end 

  counter == 0 
end 

p valid_parentheses("  (") == false
# p valid_parentheses(")test") == false
# p valid_parentheses("") == true
# p valid_parentheses("hi())(") == false
# p valid_parentheses("hi(hi)()") == true

=end 

# require 'pry'
# def isPrime(num)
#   return false if num < 2 
#   binding.pry
#   2.upto(Math.sqrt(num)) do |divisor| 
#     binding.pry
#     return false if num % divisor == 0 
#   end 
  
#   true 
# end

# p isPrime(2)

# integer = 37 

# def is_prime?(num) 
# 	2.upto(Math.sqrt(num)) do |divisor|
# 		return false if num % divisor == 0 
# 	end 

# true 
# end 

# p is_prime?(integer)

# You will be given an array of numbers. You have to sort the odd numbers in ascending order while leaving the even numbers at their original positions.

# Examples
# [7, 1]  =>  [1, 7]
# [5, 8, 6, 3, 4]  =>  [3, 8, 6, 5, 4]
# [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]  =>  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]


# def sort_array(source_array)
#   result = []
  
#   odds = source_array.select { |num| num.odd? }.sort
#   index = 0

#   source_array.each do |num|
#     if num.odd?
#       result << odds[index]
#       index += 1
#     else
#       result << num
#     end
#   end
  
#   result
# end

# p sort_array([5, 3, 2, 8, 1, 4, 11])

# [1, 3, 5, 11]



=begin
Your job is to write a function which increments a string, to create a new string.

If the string already ends with a number, the number should be incremented by 1.
If the string does not end with a number. the number 1 should be appended to the new string.
Examples:

foo -> foo1

foobar23 -> foobar24

foo0042 -> foo0043

foo9 -> foo10

foo099 -> foo100

Attention: If the number has leading zeros the amount of digits should be considered.

p increment_string("foo") == "foo1"
p increment_string("foobar001") == "foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar00") == "foobar01"
p increment_string("foobar99") == "foobar100"
p increment_string("") == "1"

p: 
input: string 
output: new string 
goal: return new string- if input ends in number, increment number by 1, or append 1 to input string. 
rules: 
      - string may or may not end in number
      - if ends in number, increment number by 1 based on its integer value 
      - if empty string, return '1'
      - number may have leading zeros 

e: 
p increment_string("foo") == "foo1"
p increment_string("foobar001") == "foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar00") == "foobar01"
p increment_string("foobar99") == "foobar100"
p increment_string("") == "1"

d: 
string ... 

array (separated alphabetic and numberic values) 

new_string 

a: 
- check if string ends in number
  - if not, append '1' to input string and return it
  - if so, 
    - convert number to integer, increment integer by 1
    - convert integer back to string
    - append number to alphabetic portion of string
  

c: 


def increment_string(input)
  return '1' if input == ''
  if input[-1].match?(/\d/) 
    letters, digits = input.chars.partition { |char| char.match?(/[a-z]/i) }
    letters.join + digits.join.next
  else
    "#{input}1"
  end
end
=end 


=begin
Given a string s, sort it in decreasing order based on the frequency of the characters. The frequency of a character is the number of times it appears in the string.

Return the sorted string. If there are multiple answers, return any of them.



p: 
input: string
output: string sorted 
goal: return new string with characters sorted in decreasing order based on the frequency that they   appear in string. 
rules: 
      - frequency is number of times character occurs in the string
      - return string should be sorted in decreasing frequency order 
        - 'beer' --> 'eebr'
      - if characters occur same number of times, order is irrelevant for those chars
      - may be mutliple answers, any of them are valid
      - individual chars should be sorted together with like chars. 
      -case sensitive... 'A' and 'a' are different chars 

Example 1:

Input: s = "tree"
Output: "eert"
Explanation: 'e' appears twice while 'r' and 't' both appear once.
So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
Example 2:

Input: s = "cccaaa"
Output: "aaaccc"
Explanation: Both 'c' and 'a' appear three times, so both "cccaaa" and "aaaccc" are valid answers.
Note that "cacaca" is incorrect, as the same characters must be together.
Example 3:

Input: s = "Aabb"
Output: "bbAa"
Explanation: "bbaA" is also a valid answer, but "Aabb" is incorrect.
Note that 'A' and 'a' are treated as two different characters.


d: 
string...       hash             ...new string 

hash: 
  - key as char, value as number of occurences in string 
  - to form string, char * value 

needs: 
  - count occurences of each unique character 
  - find char that occurs most often
  - create string of characters with each char grouped with like chars
  - create string with most occuring chars to least occuring chars 

a: 
- initialize empty hash to store chars and counts
- initialize empty new string
- iterate through input string
  - set each unique char as key and it's count of occurences in string as value
- sort hash by value, greatest to least 
- iterate through hash 
  - add each key * value to new string 
- return new_string



def frequency_sort(str) 
  char_count = {}
  sorted_str = ''

  str.uniq.each_char do |char|
    char_count[char] = str.count(char) 
  end 

  sorted_hash = char_count.sort_by { |k, v| v }.reverse.to_h

  sorted_hash.each do |k, v|
    sorted_str << k * v 
  end 

  sorted_str
end 


p frequency_sort('tree') == 'eert'
p frequency_sort('cccaaa') == 'aaaccc'
p frequency_sort('Aabb') == 'bbAa' 

=end 



=begin
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

 
Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]

p: 
input: array, and integer 
output: two element array (indices) 
goal: return array containing two indices of integers in the input array that sum to target value. 
rules: 
      - each input will have only one solution.. one pair of integers
      - each integer in input can only be used once. 
      - return value can occur in any order 
e: 
# p two_sum([2,7,11,15], 9) == [0, 1]
# p two_sum([3,2,4], 6) == [1, 2]
# p twosum([3, 3], 6) == [0, 1] 

d: 
array, integer ....   array           ...array(two indices) 

needs: 
iterate through array 
sum two element pairs 
track indices of pairs 

a: 
- create start index 
- create end index as start index + 1
- iterate through arr
  - check element at start_idx + element as end idx
  - sum two elements
  - check if sum == target
  - if so, return an array including start idx and end idx 
- return indices 
=end 

# def two_sum(arr, target) 
#   seen = []
#   valid_pair = []

#   arr.each do |num|
#     if seen.include?(target - num)
#       valid_pair << (target - num) << num 
#     else seen << num 
#     end 
#     seen = seen.uniq 
#   end 

#   [arr.index(valid_pair[0]), arr.index(valid_pair[1])]

# end 

# p two_sum([2,7,11,15], 9) == [0, 1]
# p two_sum([3,2,4], 6) == [1, 2]
# p two_sum([3, 3], 6) == [0, 1] 


# def top_k_frequent(arr, k)
#   word_count = {}

#   arr.each do |word| 
#     word_count[word] = arr.count(word) 
#   end 

#   sorted_word_count = word_count.sort_by { |k, v| -v, k }.to_h

#   sorted_word_count.keys.first(k)
# end 


# p top_k_frequent(["i","love","leetcode","i","love","coding"], 2) #== ["i","love"]
# p top_k_frequent(["the","day","is","sunny","the","the","the","sunny","is","is"], 4) == ["the","is","sunny","day"]
# p top_k_frequent(["i","love","leetcode","i","love","coding"], 1)


=begin

You are given a 0-indexed integer array nums. In one operation, you may do the following:

Choose two integers in nums that are equal.
Remove both integers from nums, forming a pair.
The operation is done on nums as many times as possible.

Return a 0-indexed integer array answer of size 2 where answer[0] is the number of pairs that are formed and answer[1] is the number of leftover integers in nums after doing the operation as many times as possible.

 

Example 1:

Input: nums = [1,3,2,1,3,2,2]
Output: [3,1]
Explanation:
Form a pair with nums[0] and nums[3] and remove them from nums. Now, nums = [3,2,3,2,2].
Form a pair with nums[0] and nums[2] and remove them from nums. Now, nums = [2,2,2].
Form a pair with nums[0] and nums[1] and remove them from nums. Now, nums = [2].
No more pairs can be formed. A total of 3 pairs have been formed, and there is 1 number leftover in nums.
Example 2:

Input: nums = [1,1]
Output: [1,0]
Explanation: Form a pair with nums[0] and nums[1] and remove them from nums. Now, nums = [].
No more pairs can be formed. A total of 1 pair has been formed, and there are 0 numbers leftover in nums.
Example 3:

Input: nums = [0]
Output: [0,1]
Explanation: No pairs can be formed, and there is 1 number leftover in nums.


p: 
input: array
output: two element array 
goal: remove all pairs from the input array and return a two element array where the first element is the number of pairs removed from the input array, and the second element is the number of remaining elements in the input array after pairs have been removed. 
rules: 
  - if no pairs can be formed, return [0, arr.size] 
  - empty array [0, 0] 

e: 
p number_of_pairs([1,3,2,1,3,2,2]) == [3, 1] 
p number_of_pairs([1, 1]) == [1, 0]
p number_of_pairs([0]) == [0, 1]

d: 
array ...    hash           ...array (two elements) 

hash: 
- key will be each element
- value will be count of element in the input array 

hash = {1 => 2, 2 => 3, 3 => 2 } 


  

a: 
- initialize empty hash
- iterate over array 
  - add each element as a key in the array
  - add the count of each element in the input array as value 
- create array of values from the hash 
- initialize pairs counter and set to 0 
- initiliaze remaining counter and set to 0 

- iterate through values array 
  - check number of pairs that can be formed by dividing each value by 2
  - check the remainder of the division to see the remainder. 
  - save pairs and remainder to array 
  - add first element of the array to pairs counter 
  - add second element of the array to remaining counter 

- return array with the two elements being [pairs_counter, remaining_counter] 



def number_of_pairs(arr)
  element_count = {}

  arr.each do |num| 
    element_count[num] = arr.count(num) 
  end 

  values_arr = element_count.values

  pairs_counter = 0 
  remaining_counter = 0 

  values_arr.each do |num| 
    pairs_remain_arr = num.divmod(2) 
    pairs_counter += pairs_remain_arr[0]
    remaining_counter += pairs_remain_arr[1]
  end 

  [pairs_counter, remaining_counter] 
end 

# p number_of_pairs([1,3,2,1,3,2,2]) == [3, 1] 
p number_of_pairs([1, 1]) == [1, 0]
# p number_of_pairs([0]) == [0, 1]

=end 




=begin
Given an array of integers nums, sort the array in increasing order based on the frequency of the values. If multiple values have the same frequency, sort them in decreasing order.(of frequency) 

Return the sorted array.

 [4, 5, 4, 5, 5, 6, 1] = [1, 6, 4,4, 5, 5 5] 

Example 1:

Input: nums = [1,1,2,2,2,3]
Output: [3,1,1,2,2,2]
Explanation: '3' has a frequency of 1, '1' has a frequency of 2, and '2' has a frequency of 3.
Example 2:

Input: nums = [2,3,1,3,2]
Output: [1,3,3,2,2]
Explanation: '2' and '3' both have a frequency of 2, so they are sorted in decreasing order.
Example 3:

Input: nums = [-1,1,-6,4,5,-6,1,4,1]
Output: [5,-1,4,4,-6,-6,1,1,1]

p: 
input: array 
outputput: array 
goal: sort array based in increasing order of frequency. 
rules: 
  - if multiple values have same frequency
    - sort in decreasing order of frequency first, then by value 

e: 
d: 
array ....     hash .... array 


a: 
- init hash 
- iterate through array 
  - build hash with keys as integer, values as frequency
- check if any two values are the same 
  - if not, sort array of keys by increasing frequency 
  - if so, sort array of keys by frequency first, then highest to lowest key 
-return array 



def frequency_sort(nums)
  hash = {}

  nums.each do |num|
    hash[num] = nums.count(num)
  end 

  sorted = nil 
  if multiple_values?(hash)
    sorted = hash.sort_by { |k, v| [v, -k] }.to_h 
  else 
    sorted = hash.sort_by { |k, v| [v, k] }.to_h
  end 

  new_arr = []
  sorted.each do |k, v| 
    v.times do 
      new_arr << k 
    end 
  end 

  new_arr

end 

def multiple_values?(hash)
  hash.values.any? { |v| hash.values.count(v) > 1 } 
end 



p frequency_sort([1,1,2,2,2,3]) == [3,1,1,2,2,2]
p frequency_sort([2,3,1,3,2]) ==[1,3,3,2,2]
p frequency_sort([-1,1,-6,4,5,-6,1,4,1]) == [5,-1,4,4,-6,-6,1,1,1]

=end 




=begin

Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

 

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]
Example 3:

Input: nums = [], target = 0
Output: [-1,-1]
 

Constraints:

0 <= nums.length <= 105
-109 <= nums[i] <= 109
nums is a non-decreasing array.
-109 <= target <= 109
Accepted
1,245,115
Submissions





def search_range(nums, target)
  return [-1, -1] if !nums.include?(target)
    
  target_indices = []
    
  nums.each_with_index do |num, idx|
    if num == target
      target_indices << idx 
    end 
  end 
    
  target_indices.minmax
end
=end 


=begin

Given non empty string check if it can be constructed by taking a substring of it an appending multiple copies of substring together. Assume given string consists of lowercase English letters only.

Example 1: 

Input: 'abab'
Output: true 
Explanation: It's the substring 'ab' twice.

Example 2: 

Input: 'aba'
Output: false
Explanation: String cannot be constructed from repeating substring. 



p repeated_substring_patten('abab') == true
p repeated_substring_patten('aba') == false
p repeated_substring_patten('aabaaba') == false
p repeated_substring_patten('abaababaab') == true 
p repeated_substring_patten('abcabcabcabc') == true 

=end 


=begin 

Given array of strings made only of lowercase letters, return array of all characters that show up in all strings within the given array (including duplicates) For example, if a character occurs 3 times in all strings, but not 4 times, you need to include that character three times in the final answer.

p common_chars('bella', 'label', 'cook') == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz) == []

=end 


=begin

You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits. 

examples: 
12 --> 21 
513 --> 531
2017 --> 2071

If no bigger number can be formed using these digits, return -1. 

examples: 
9 --> -1
111 --> -1
531 --> -1 

p next_bigger(9) == -1
p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(111) == -1
p next_bigger(531) == -1
p next_bigger(123456789) == 123456798

=end 
  
  



=begin

The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence of an array of integers.

Easy case is when input array is all positive, then return total sum of array. 

If total array is made up of only negative numbers, return 0 instead. 

Empty array assumed to have 0 greatest sum. Note the empty array is also a valid subarray. 


max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
max_sequence([]) == 0 
max_sequence([11] == 11
max_sequence([-32] == 0 
max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4] == 12

=end 





=begin

Write a method to find the longest common prefix string amongst an array of strings

If no common prefix, return empty string.

All given inputs are in lowercase letters a-z.

p common_prefix(%w(flower, flow, flight)) == 'fl'
p common_prefix(%w(dog racecar car)) == ''
p common_prefix(%w(interspecies interstellar interstate)) == 'inters'
p common_prefix(%w(throne dungeon)) == ''
p common_prefix(%w(throne throne)) == 'throne'

=end 



# write a method to determine if a word is a palindrome, without using the reverse method"

# def is_pal?(word)
#   backwards = []
  
#   (word.size - 1).downto(0) do |idx|
#     backwards << word[idx] 
#   end 
  
#   backwards.join == word

# end 

# p is_pal?('fisherman') == false
# p is_pal?('racecar') == true
# p is_pal?('mom') == true
# p is_pal?('Dad') == false 


#"select the element out of the array if its index is a fibonacci number"


# def fib_idx(arr)
#   arr.select.with_index do |element, idx|
#     is_fib?(idx) 
#   end 
# end 
    
  
# def is_fib?(num)
#   return true if num == 0 
  
#   sequence = [0, 1]
  
#   until sequence[-1] >= num do
#     sequence << sequence[-2] + sequence[-1] 
#   end 
#   sequence[-1] == num 
# end 

# p fib_idx([5,7,7,8,8,10]) #== [5, 7, 7, 8, 10]




=begin

The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence of an array of integers.

Easy case is when input array is all positive, then return total sum of array. 

If total array is made up of only negative numbers, return 0. 

Empty array assumed to have 0 greatest sum. 



p: 
input: array 
output: integer (max-sum of consecutive subset of numbers in the input array) 
goal: return max sum of a contiguous subsequence of integers in the array. 
rules: 
- if all numbers negative, return 0
- if input is empty, return 0
- contiguous subsequence is consecutive elements of the array
- max, is highest possible sum 
- if only one positive integer in array, return that integer as max sum
- if only one negative num in array, return 0 

e: 
max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
max_sequence([]) == 0 
max_sequence([11] == 11
max_sequence([-32] == 0 
max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4] == 12

d: 
array ....      subarrays... array of sums           .... integer (sum) 

subarrays: 
  - consecutive elements from input array 

  array of sums of subarrays. 

  [[1, 2, 3], [-5, 4, 1], [3, -10, 4]] ---> [[6], [0], [-3]] ----> [6, 0, 3] 

a: 
- create subarrays of all possible consecutive elements 
  - create start index to begin iteration 
  - create end index to control size of subarray
  - iterate through input arr
    - add element at start index .. end_index to subarray
    - increment end_index and repeat until reach final end_index 
  - increment start_index... repeat until start index is last element. 
- iterate through subarrays
  - calculate sum of elements 
  - return array of sums of each subarray
- iterate through array of sums
- return maximum number 

c: 


def max_sequence(arr)
  return 0 if arr.empty?

  subarrays = get_subs(arr) 

  subarrays.map! do |subarr| 
    subarr.sum 
  end 

  return 0 if subarrays.max < 0 

  subarrays.max 

end 

def get_subs(arr)
  subarrays = []

  0.upto(arr.size - 1) do |start_index| 
    start_index.upto(arr.size - 1) do |end_index| 
      subarrays << arr[start_index..end_index] 
    end 
  end 

  subarrays 
end 

p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([]) == 0 
p max_sequence([11]) == 11
p max_sequence([-32]) == 0 
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

=end 


=begin

Write a method to find the longest common prefix string amongst an array of strings

If no common prefix, return empty string.

All given inputs are in lowercase letters a-z.

p common_prefix(%w(flower, flow, flight)) == 'fl'
p common_prefix(%w(dog racecar car)) == ''
p common_prefix(%w(interspecies interstellar interstate)) == 'inters'
p common_prefix(%w(throne dungeon)) == ''
p common_prefix(%w(throne throne)) == 'throne'


p: 
input: array 
output: substring (prefix)
goal: return substring that is the longest prefix common among all elements of the input array. 
rules: 
  - if no common prefix present between all elements, return ''
  - longest common prefix will be longest leading substring that occurs in each element
  - if all elements are same, return any element

e: 
p common_prefix(%w(flower, flow, flight)) == 'fl'
p common_prefix(%w(dog racecar car)) == ''
p common_prefix(%w(interspecies interstellar interstate)) == 'inters'
p common_prefix(%w(throne dungeon)) == ''
p common_prefix(%w(throne throne)) == 'throne'

d: 
array...    new_array for first element... array of leading substring    ... substring (prefix) 

needs: 
- iterate through input array 
- generate leading substrings for first element 

arr = ['flower', 'flow', 'flight'] 

f
fl
flo
flow
flowe
flower

a: 
- remove first element from the input array, leaving other elements in array in place

- create an array of all leading substrings of first element *(helper)*
  - initialize empty substrings array
  - create end_index range from start of string to end 
  - iterate through string characters by index
    - starting at 0, ending at end_index.
    - add to substrings arr, str[0..end_index] for each iteration

- sort substrings in descending order by size 
- iterate through substrings
  - iterate through main array 
  - check if all elements in main array start with the current substring
    - if so, return that substring
    - if not, move to next smaller substring.
    - if reach end of substrings with no substring returned, return ''. 

c: 


def common_prefix(arr)
  first_word = arr.shift 
  leading_substrings = get_subs(first_word) 

  leading_substrings.sort_by! { |substr| substr.length }.reverse!

  leading_substrings.each do |substr|
    return substr if arr.all? { |word| word.start_with?(substr) }
  end 

  ''
end 

def get_subs(str)
  substrings = []

  0.upto(str.length - 1) do |end_index| 
    substrings << str[0..end_index] 
  end 

  substrings 
end 


p common_prefix(%w(flower flow flight)) == 'fl'
p common_prefix(%w(dog racecar car)) == ''
p common_prefix(%w(interspecies interstellar interstate)) == 'inters'
p common_prefix(%w(throne dungeon)) == ''
p common_prefix(%w(throne throne)) == 'throne'
=end 


=begin

Given 2 strings, find out if there is a substring that appears in both strings. Return true if you find a substring that appears in both strings, or false if not. Only consider substrings that are longer than one letter long. 

p substr_test('Something', 'Fun') == false 
p substr_test('Something', 'Home') == true
p substr_test('Something, '') == false
p substr_test('', 'Something') == false
p substr_test('Banana', 'banana') == true
p substr_test('test', 'lllt') == false
p substr_test('', '') == false
p substr_test('1234567', '541256') == true
p substr_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

=end 


=begin

Write a function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise return false. 

For example: 

str1 is 'rkqodlw' and str2 is 'world' the output should return true

p scramble('javaass', 'jjss') == false 
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqty', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true 

=end 


=begin

Given 2 strings, find out if there is a substring that appears in both strings. Return true if you find a substring that appears in both strings, or false if not. Only consider substrings that are longer than one letter long. 

p substr_test('Something', 'Fun') == false 
p substr_test('Something', 'Home') == true
p substr_test('Something, '') == false
p substr_test('', 'Something') == false
p substr_test('Banana', 'banana') == true
p substr_test('test', 'lllt') == false
p substr_test('', '') == false
p substr_test('1234567', '541256') == true
p substr_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

p: 
input: two strings
output: boolean
goal: return true if there is a substring greater than one character that is present in both strings. 
rules: 
      - only considering substrings longer than 1 char in length
      - if one of the two input strings is empty, return false 
      - substring must be consecutive characters in each string.
question: case sensitive? assuming so, for this practice

e: 
p substr_test('Something', 'Fun') == false 
p substr_test('Something', 'Home') == true
p substr_test('Something, '') == false
p substr_test('', 'Something') == false
p substr_test('Banana', 'banana') == true
p substr_test('test', 'lllt') == false
p substr_test('', '') == false
p substr_test('1234567', '541256') == true
p substr_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

d: 
two strings ....   substrings array                ...true or false 

needs: 
  - create substrings of input string
  - compare substrings to second string to see if second string inlcudes any substring

a: 
- check if str1 or str2 is empty?
  - if so, return false

- **create array of all substrings of first string input that are at least two chars long**
- iterate through substrings array 
  - check if current substring is present in second input string
  - if so, return true
  - if not, continue iteration
  - if true not returned after iteration is finished, return false. 


  ** create substrings**
    - should be two chars in length 
    - must be consecutive 

    algo: 
    - iterate through characters of the string from start index... start at 0. 
    - add substring slice from start_index, 2 chars long.
    - increment start index by 1
    - repeat.



def substr_test(str1, str2)
  return false if str1.empty? || str2.empty?

  str1_subs = get_substrings(str1) # helper method 

  str1_subs.each do |substr| 
    return true if str2.include?(substr) 
  end 

  false 
end 


def get_substrings(str)
  substrings = []
  
  0.upto(str.size - 2) do |start_index| 
    substrings << str[start_index, 2] 
  end 

  substrings
end 


p substr_test('Something', 'Fun') == false 
p substr_test('Something', 'Home') == true
p substr_test('Something', '') == false
p substr_test('', 'Something') == false
p substr_test('Banana', 'banana') == true
p substr_test('test', 'lllt') == false
p substr_test('', '') == false
p substr_test('1234567', '541256') == true
p substr_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

=end 


=begin

Write a function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise return false. 

For example: 

str1 is 'rkqodlw' and str2 is 'world' the output should return true

# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqty', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('scriptjava', 'javascript') == true
# p scramble('scriptingjava', 'javascript') == true 


p: 
input: two strings
output: boolean
goal: return true if a portion of characters in str1 can be rearranged to create str2.
rules: 
      - str1 must contain all characters present in str2
        - matching chars must also occur in str1 at least as many times as in str 2. 
      - if either string is empty, return false 

question: case sensitivity? assume so. 

e: 
# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqty', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('scriptjava', 'javascript') == true
# p scramble('scriptingjava', 'javascript') == true 

d: 
two strings ....                    ...true or false 

needs: 
  - if every char in str2, is present at least as many times in str1 
  - if all characters in str2 are present in str1

a: 
  - break str2 into array of characters 
  - iterate through str2 characters
    -check count of current_char in str2
      - compare count in str2, to count of that char in str1
      - if count in str2 <= count in str 1
        - return true from the block 
      - repeat for each char in str 2
    - if all return true from the block, 
    - return true, otherwise, false 


def scramble(str1, str2)
  str2_chars = str2.chars

  str2_chars.all? do |char| 
    str1.count(char) >= str2.count(char) 
  end 

end 

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqty', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true 
=end 


=begin

Find length of the longest substring in the given string that is the same in reverse. 

As an example, if the input ws "I like racecars that go fast", the substring ('racecar') length would be 7. 

If the length of the input string is 0, return value must be 0.

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9 

=end 

=begin

You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:

Let's say you are given the array [1,2,3,4,3,2,1]: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ([3,2,1]) both equal 6.

Another one: 

You are given the array [20,10,-80,10,10,15,35]
At index 0 the left side is []
The right side is [10,-80,10,10,15,35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.


p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1



def longest_palindrome(str)
  substrings = get_subs(str)

  palindromes = substrings.select do |substr|
    substr == substr.reverse
  end 

  palindromes.sort_by! { |pal| -pal.size } 

  palindromes[0].size

end 

def get_subs(str)
  substrings = []

  0.upto(str.length - 1) do |start_index|
    start_index.upto(str.length - 1) do |end_index|
      substrings << str[start_index..end_index]
    end 
  end 

  substrings

end 

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9 


=end 

=begin

You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:

Let's say you are given the array [1,2,3,4,3,2,1]: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ([3,2,1]) both equal 6.

Another one: 

You are given the array [20,10,-80,10,10,15,35]
At index 0 the left side is []
The right side is [10,-80,10,10,15,35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.


P; 
input: array 
output: single integer or -1 
goal: return index location of input array where left side sum == right side sum. 
rules: 
      - if index is 0, left sum == 0 
      - if index is arr.size - 1, right sum == 0 
      - sum of each side should not include integer at that index.
      - if none exist, return -1. 
e:
p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

d: 

array...     array           ...integer(index)


a: 
-  iterate through array by index
  - calculate sum of all elements up to one less than current index
    - assign sum to left_sum
  - calculate sum of elements from index + 1 to end of the array
    - assign to right sum
  - compare right sum to left sum 
    - if equal, return index
  - if iteration is complete and no index returned, return -1

c: 


def find_even_index(arr)
  arr.each_with_index do |num, idx| 
    return idx if arr[0...idx].sum == arr[idx + 1..-1].sum 
  end 

  -1
end 
  


p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

=end 



=begin
You are given a 0-indexed integer array nums. You are also given an integer key, which is present in nums.

For every unique integer target in nums, count the number of times target immediately follows an occurrence of key in nums. In other words, count the number of indices i such that:

0 <= i <= nums.length - 2,
nums[i] == key and,
nums[i + 1] == target.
Return the target with the maximum count. The test cases will be generated such that the target with maximum count is unique.

 

Example 1:

Input: nums = [1,100,200,1,100], key = 1
Output: 100
Explanation: For target = 100, there are 2 occurrences at indices 1 and 4 which follow an occurrence of key.
No other integers follow an occurrence of key, so we return 100.
Example 2:

Input: nums = [2,2,2,2,3], key = 2
Output: 2
Explanation: For target = 2, there are 3 occurrences at indices 1, 2, and 3 which follow an occurrence of key.
For target = 3, there is only one occurrence at index 4 which follows an occurrence of key.
target = 2 has the maximum number of occurrences following an occurrence of key, so we return 2.

P: 
input: arr and integer (key)
output: single integer num from array 
goal: return element from input array that immediately follows given key most frequently in input array: 
rules: 
  - target num with maximum count will be unique
  - target nums must immediately follow key 
  - if none exist return empty arr?

e: 

p most_frequent([1,100,200,1,100], 1) == 100 
p most_frequent([2,2,2,2,3], 2) == 2

d: 

array and integer(key) ....      array             ....element from input array

subarray
  - contain all elements that immediately follow key 

a: 
- initialize target nums to empty array
- iterate through input array from start to second to last element. 
  - check if current element is key
    - if so, add next element to target nums
    - if not, continue iterating
- iterate through target nums
  - check which occurs most often
    - check count of each target num in target array
    - return element with highest count.

c: 


def most_frequent(arr, key)
  target_nums = []

  0.upto(arr.size - 2) do |idx|
    if arr[idx] == key 
      target_nums << arr[idx + 1] 
    end 
  end 

  target_nums.max_by { |num| target_nums.count(num) }  
end 

p most_frequent([1,100,200,1,100], 1) == 100 
p most_frequent([2,2,2,2,3], 2) == 2
=end 


=begin

Given an array of integers nums, return the number of good pairs.

A pair (i, j) is called good if nums[i] == nums[j] and i < j.

Example 1:

Input: nums = [1,2,3,1,1,3]
Output: 4
Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
Example 2:

Input: nums = [1,1,1,1]
Output: 6
Explanation: Each pair in the array are good.
Example 3:

Input: nums = [1,2,3]
Output: 0


p: 
input: array 
output: integer(num of good pairs)
goal: return count of number of pairs where each element in the pair has the same value, and the first element in the pair occurs first in the input array. 
rules: 
    - pair is good if each element in the pair has same value
      - first element in the pair, must have lower index than second. 
    - if no good pairs exist, return 0 
    - elements can be reuused to make new pairs.
    - pairs should contain unique elements 

e: 
p num_identical_pairs([1,2,3,1,1,3]) == 4
p num_identical_pairs([1,1,1,1]) == 6
p num_identical_pairs([1, 2, 3]) == 0 

d: 
array...            ... integer 

needs: 
  - create two element pairs 
  - pairs should be in order of appearance [1, 2, 3]... [1, 2] but not [2, 1] 

a: 

- create all possible two element pairs from input array
- initialize pairs empty array
  - initialize start index range from 0 second to last element (arr.size - 2) 
  - initilaize end_index which will be second element in each pair
    - range for end_index will be start_index + 1 up to last element in array. 
- iterate throgh input array 
  - add to pairs array an array with [element at start index, end index]
- return pairs array

- initialize counter local variable and set to 0. 
- iterate through pairs
  - check if both elements in the pair are equal in value
  - if so, increment counter by 1. 
  - if not, continue iterating to next pair
- end iteration when reach the end of pairs array 

- return counter. 



def num_identical_pairs(arr) 
  pairs_arr = get_pairs(arr) 

  pairs_arr.size 
end 

def get_pairs(arr)
  pairs = []

  0.upto(arr.size - 2) do |start_idx|
    (start_idx + 1).upto(arr.size - 1) do |end_idx| 
      if arr[start_idx] == arr[end_idx] 
        pairs << [arr[start_idx], arr[end_idx]] 
      else 
        next 
      end 
    end 
  end 

  pairs 

end 



p num_identical_pairs([1,2,3,1,1,3]) == 4
p num_identical_pairs([1,1,1,1]) == 6
p num_identical_pairs([1, 2, 3]) == 0 
=end 



=begin   ** tricky leetcode one
Given two strings s and t, find the number of ways you can choose a non-empty substring of s and replace a single character by a different character such that the resulting substring is a substring of t. 

In other words, find the number of substrings in s that differ from some substring in t by exactly one character.

For example, the underlined substrings in "computer" and "computation" only differ by the 'e'/'a', so this is a valid way.

'compute'

Return the number of substrings that satisfy the condition above.

A substring is a contiguous sequence of characters within a string.

 


p count_substrings('aba', 'baba') == 6
p count_substrings('ab', 'bb') == 3



=end 


# def substrings(str)
#   (0...str.size).each_with_object([]) do |index, substrings|
#     1.upto(str.size - index) {|length| substrings << str[index, length]}
#   end
# end


# def count_characters(words, chars)
#   results = []
#     words.each do |word| 
#       results << word if word.chars.all? do |char| 
#         chars.count(char) >= word.count(char)
#     end 
#   end 
#     results.join.length
# end


# def count_characters(words, chars)
#   results = []
#   words.each do |word|
#     characters = chars.dup  
#     results << word if word.chars.all? do |char|
#       characters.sub!(char, '')
#     end 
#   end 
#   results.join.length 
# end 

# count_characters(["cat","bt","hat","tree"], "atach")
# count_characters(["hello","world","leetcode"], "welldonehoneyr")



# Given a string, find all those substrings contained in it of at least two characters where the substring is adjacent to a substring that is the reverse of it. 




# Write a method that returns all pairs of elements in an array that when multiplied
# equal 100.
#
# The original array may contain duplicate numbers. Each two-element
# subarray in your output should be distinct. Subarrays themselves should
# be ordered in the same sequence as they appear in the original array.
#
# Return an empty array if no 2 elements can be multiplied to equal one hundred or there are fewer
# than 2 elements in the array. 

#  Note: You are not allowed to use Array#combination method 

# Examples:

# p two_multiply([0, 10, -1, -1, 1]) == []
# p two_multiply([0, 10, 2, 5, 10, -10]) == [[10, 10]]
# p two_multiply([1, 2, 3]) == []
# p two_multiply([1]) == []
# p two_multiply([1, 4, 4, 25, -3, -8, 4]) == [[4, 25], [25, 4]];
# p two_multiply([1, 5, 2, 100, 4]) == [[1, 100]];
# require 'pry'
# def two_multiply(arr)
#   subarrays = get_subs(arr)

#   valid = subarrays.select do |subarr|
#     subarr[0] * subarr[1] == 100 
#   end 
  
#   valid.uniq 
  
  
# end 

# def get_subs(arr)
#   subs = []
#   0.upto(arr.size - 2) do |start_index| 
#     (start_index + 1).upto(arr.size - 1) do |end_index|
#       subs << [arr[start_index], arr[end_index]]
#     end 
#   end 
  
#   subs 
  
# end 

# p get_subs([1, 2, 3])

# p two_multiply([0, 10, -1, -1, 1]) == []
# p two_multiply([0, 10, 2, 5, 10, -10]) == [[10, 10]]
# p two_multiply([1, 2, 3]) == []
#p two_multiply([1]) == []
# p two_multiply([1, 4, 4, 25, -3, -8, 4]) == [[4, 25], [25, 4]]
# p two_multiply([1, 5, 2, 100, 4]) == [[1, 100]]



# Write a method that returns all pairs of elements in an array that when multiplied
# equal 100.
#
# The original array may contain duplicate numbers. Each two-element
# subarray in your output should be distinct. Subarrays themselves should
# be ordered in the same sequence as they appear in the original array.
#
# Return an empty array if no 2 elements can be multiplied to equal one hundred or there are fewer
# than 2 elements in the array. 

#  Note: You are not allowed to use Array#combination method 

# Examples:

# p two_multiply([0, 10, -1, -1, 1]) == []
# p two_multiply([0, 10, 2, 5, 10, -10]) == [[10, 10]]
# p two_multiply([1, 2, 3]) == []
# p two_multiply([1]) == []
# p two_multiply([1, 4, 4, 25, -3, -8, 4]) == [[4, 25], [25, 4]];
# p two_multiply([1, 5, 2, 100, 4]) == [[1, 100]];

=begin 

P:

- input: array (integers positive and/or negative)
- output: array of subarrays (distinct subarrays) 
- goal: return an array of two element subarrays whose elements, when multiplied, equal 100. 
- rules: 
        - input may contain duplicate numbers
        - returned array should only contain unique subarrays 
        - subarrays should be ordered in accordance with appearance in the input
        - return empty array if no two elements in the input array can be multiplied to equal 100
        - return empty array if input array contains less than 2 elements
        - ** do not use the combination method**

e: 
p two_multiply([0, 10, -1, -1, 1]) == []
p two_multiply([0, 10, 2, 5, 10, -10]) == [[10, 10]]
p two_multiply([1, 2, 3]) == []
p two_multiply([1]) == []
p two_multiply([1, 4, 4, 25, -3, -8, 4]) == [[4, 25], [25, 4]]
p two_multiply([1, 5, 2, 100, 4]) == [[1, 100]]


d: 
array ...   array of subarrays...valid pairs array              ...array of subarrays

needs:
   - find two element pairs (all combinations from input array)
   - way to check if each pair when multiplied equals 100
   - array to hold valid pairs 
   - way to check if valid pairs are unique, and remove any duplicates. 


a: 
- create an array of subarrays of all two element combinations from input
  - [1, 2, 3] = [[1, 2], [1, 3], [2, 3]] 
     - create start index range (0..arr size - 2)
     - create end index range from start index + 1 to array size - 1
     - iterate through ranges -- outer loop (start_index)
                              -- inner loop (end_index range)
      - add to separate the element from the input array at the start index and end index in subarray.
- iterate through array of subarrays
  - for each element (subarray) 
  - check if the two elements when multiplied, equal 100
        - if so, push that subarray to valid subarrays array
        - if not, continue iterating
- remove any duplicates from valid subarrays
- return unique subarrays in an array. 

=end 
# def two_multiply(arr)
#   return [] if arr.size < 2

#   all_subarrays = get_subs(arr) 

#   valid_subarrays = all_subarrays.select do |subarr|
#     subarr[0] * subarr[1] == 100
#   end 

#   valid_subarrays.uniq
# end 


# def get_subs(arr)
#   subarrays = []

#   0.upto(arr.size - 2) do |start_index|
#     (start_index + 1).upto(arr.size - 1) do |end_index| 
#       subarrays << [arr[start_index], arr[end_index]]
#     end 
#   end 

#   subarrays 

# end 
          


# p two_multiply([0, 10, -1, -1, 1]) == []
# p two_multiply([0, 10, 2, 5, 10, -10]) == [[10, 10]]
# p two_multiply([1, 2, 3]) == []
# p two_multiply([1]) == []
# p two_multiply([1, 4, 4, 25, -3, -8, 4]) == [[4, 25], [25, 4]]
# p two_multiply([1, 5, 2, 100, 4]) == [[1, 100]]



# a: 
# - create two arrays, first array of all letters and second, numbers 
# - 





# str = 'a1b2c3'

# def swap(str)
#   nums = str.scan(/[0-9]/)
#   letters = str.scan(/[a-zA-Z]/)
  
#   hash = nums.zip(letters).to_h
#   new_str = ''

#   str.each_char do |char|
#     if hash.key?(char)
#       new_str << hash[char]
#     else 
#       new_str << hash.key(char)
#     end 
#   end 
  
#   new_str
  
# end 

# p swap(str)


=begin

In this kata, you have an input string and you should check whether it is a valid message. To decide that, you need to split the string by the numbers, and then compare the numbers with the number of characters in the following substring.

For example "3hey5hello2hi" should be split into 3, hey, 5, hello, 2, hi and the function should return true, because "hey" is 3 characters, "hello" is 5, and "hi" is 2; as the numbers and the character counts match, the result is true.

Notes:

Messages are composed of only letters and digits
Numbers may have multiple digits: e.g. "4code13hellocodewars" is a valid message
Every number must match the number of character in the following substring, otherwise the message is invalid: e.g. "hello5" and "2hi2" are invalid
If the message is an empty string, you should return true


valid?("3hey5hello2hi") == true)
valid?("4code13hellocodewars") == true
valid?("3hey5hello2hi5") == false
valid?("code4hello5") == false
valid?("1a2bb3ccc4dddd5eeeee") == true
valid?("") == true


Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 number


p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28




There is a message that is circulating via public media that claims a reader can easily read a message where the inner
letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the
letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.
In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours
will be sorted alphabetically

Requirement
return a string where:
1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions
1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation


p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'

=end


# P: 

# Goal.. summarize understanding.

# Rules: internalized understanding in own words 
# ex: argument cannot end in number 

# examples: 
# why each one failed or passed 
#     - matched to rules 
    
    
# general approach, written down 

# walked through expected return value when checking method 


# stopped: 'need to have better grip on mental model'..shift ot higher level 



# walking thorugh example and what code is doing 


# def valid?(str)
#   number = ''
#   word = ''

#   str.each_char do |char|
#     if char.match(/[0-9]/)
#       if !word.empty? && word.size == number.to_i
#         number = ''
#         word = ''
#       else
#         false
#       end
#       number << char
#     elsif char.match(/[A-z]/)
#       return false if number.empty?
#       word << char
#     end
#   end
#   if word.size == number.to_i
#     true
#   else
#     false
#   end
# end

# def valid?(str)
#   number = ''
#   word = ''

#   str.each_char do |char|
#     if char.match(/[0-9]/)
#       if !word.empty? && word.size == number.to_i
#         number = ''
#         word = ''
#       else
#         false
#       end
#       number << char
#     elsif char.match(/[A-z]/)
#       return false if number.empty?
#       word << char
#     end
#   end
#   if word.size == number.to_i
#     true
#   else
#     false
#   end
# end

# p valid?("3hey5hello2hi") == true
# p valid?("4code13hellocodewars") == true
# p valid?("3hey5hello2hi5") == false
# p valid?("code4hello5") == false
# p valid?("1a2bb3ccc4dddd5eeeee") == true
# p valid?("") == true


=begin

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur
more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and
lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice


p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

=end

=begin
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is
equal to t repeated k times. The input string consists of lowercase latin letters. Your function should return a tuple (in
Python) (t, k) or an array (in Ruby and JavaScript) [t, k]

Example #1:
for string
s = "ababab"
the answer is
["ab", 3]

Example #2:
for string
s = "abcde"
the answer is
because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself. 

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
=end

# def duplicate_count(string)
#   repeating_characters = Hash.new(0)
#   string.chars.each do |character|
#     repeating_characters[character.downcase] += 1
#   end
#   repeated_character_count = 0
#   repeating_characters.each_value do |value|
#     repeated_character_count += 1 if value > 1
#   end
#   repeated_character_count
# end

# p duplicate_count("") == 0
# p duplicate_count("abcde") == 0
# p duplicate_count("abcdeaa") == 1
# p duplicate_count("abcdeaB") == 2
# p duplicate_count("Indivisibilities") == 2

=begin
Write a function that takes an array of numbers (integers for the tests) and a target number. It should find two different items in the array that, when added together, give the target value. 

The indices of these items should then be returned in a tuple / list (depending on your language) like so: (index1, index2).

For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers; target will always be the sum of two different items from that array).

Based on: http://oj.leetcode.com/problems/two-sum/

two_sum([1, 2, 3], 4) == {0, 2}

Examples:
two_sum([1, 2, 3], 4) == [0, 2]
two_sum([1234, 5678, 9012], 14690) == [1, 2]
two_sum([2, 2, 3], 4) == [0, 1]


P; input: array, and an integer 
   output: two element array 
   
   goal: return the indexes of two separate elements in the input array that when summed, equal the target number. 
   
   rules: 
        - input will always be vavlid.. array of 2 elements or greater
        - two elements will always have a sum of the target number 
        - returned indeces must be of two different elements (may have the same value)
        
        - input array should be preserved to access index of two numbers in sum 
e:

d: 
  - array ... two element array (indeces)
  
  
a: 

- iterate through the input array starting with the first element
    arr[start] + arr[end]
    increment end_index by 1 until reach end of the array. 
    increment the start index by 1 until reach second to last element in the array 
      [1, 2, 3] end index will start at start index + 1
  - sum the first element with each subsequent element
    - check if sum == target
      - if so, return index of the two elements being compared. 

c: 
=end 

# def two_sum(arr, target)
#   0.upto(arr.size - 2) do |start_index|
#     (start_index + 1).upto(arr.size - 1) do |end_index|
#       if arr[start_index] + arr[end_index] == target
#         return [start_index, end_index]
#       end 
#     end 
#   end 
# end 

# p two_sum([1, 2, 3], 4) == [0, 2]
# p two_sum([1234, 5678, 9012], 14690) == [1, 2]
# p two_sum([2, 2, 3], 4) == [0, 1]    
    

=begin 

Given a string of integers, return the number of odd-numbered substrings that can be formed.
For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.
solve("1341") = 7. See test cases for more examples.


P: 
- given string of integers find the number of odd substrings that can be formed. 
- input: string of integers
- output: single integer (number of odd substrings)
- rules: 
        - input will be string of integers
        - substrings must be sequential
          ex. if num is 13... 1, 3, 13... not 31
        - return total number of odd substrings

E: 
p solve("1341") == 7   # 1, 13, 1341, 3, 341, 41, 1
p solve("1357") == 10  # 1, 13, 135, 1357, 3, 35, 357, 5, 57, 7
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28


D: Input: string 
   intermed: array
   output: integer
   
A: 
  - define method `solve` to take one param, string of integers
  - initialize empty array to push substrings
  - find all substrings for string, push to array 
  - iterate through substrings
    - convert substring to integer
    - if integer is odd?, push to new array 
  - after iteration complete, check size of new array of odd integers
  - return number
=end  

# def solve(string)
#   all_substrings = []
#   odd_sub_integers = []
  
#   0.upto(string.length - 1) do |start_index|
#     start_index.upto(string.length - 1) do |end_index|
#       all_substrings << string[start_index..end_index]
#     end 
#   end 
#   all_substrings.each do |sub_string|
#     odd_sub_integers << sub_string if sub_string.to_i.odd?
#   end 
#   odd_sub_integers.size
# end 

  
=begin

Complete the function that takes an array of words.
You must concatenate the nth letter from each word to construct a new word which should be returned as a string,
where n is the position of the word in the list.
For example:
["yoda", "best", "has"] --> "yes"
^ ^ ^
n=0 n=1 n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.


P: given an array of words, return a new word that is a concatenation of one letter from each word in the array. For the first word, the letter selected will be the char at index 0, second word index 1, etc. 
- input: array of words 
- output: string made of of one letter from each array (based on index)
- rules: 
        - index of each word will start at 0 and increase by 1 for each word 
        - return value should be string 
        -empty array return empty string 
        - single word, return char at index 0 
        
E: 
p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'

D: input: array 
   intermed: new array 
   output: string 
   
A: 
- define method nth_char to take one parameter (array)
- initialize empty array to push chars
- initialize n_index = 0 to start
- iterate through input array, push char at n_index to new array 
- increment n_index + 1
- continue until iteration through array complete
- join chars in char array, and return string. 
=end

# def nth_char(array)
#   selected_chars = []
#   n_index = 0 
  
#   array.each do |word|
#     selected_chars << word[n_index]
#     n_index += 1
#   end 
#   p selected_chars.join
# end 

# p nth_char(['yoda', 'best', 'has']) == 'yes'
# p nth_char([]) == ''
# p nth_char(['X-ray']) == 'X'
# p nth_char(['No', 'No']) == 'No'
# p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'



=begin
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is
equal to t repeated k times. The input string consists of lowercase latin letters. Your function should return an array (in Ruby and JavaScript) [t, k]

Example #1:
for string
s = "ababab"
the answer is
["ab", 3]

Example #2:
for string
s = "abcde"
the answer is 
because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.


def f(string)
  string.size







p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]


=end
# require 'pry'

# def f(str)
#   (1..str.size).each do |substr_size|
#     substr = str[0, substr_size]
#     binding.pry
#     repetitions = str.size / substr_size
    
#     return [substr, repetitions] if substr * repetitions == str
#   end 
# end 

# p f('candle')
# p f('larrybrown')
# p f('abcabcabc')

=begin

Problem: 

Given a non-empty string, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only. 

- input: non-empty string 
- output: boolean (if can be used to construct input string)
- rules:
        - input string contains lowercase english letters only
        - substring * n == str
        - empty string return false

E: 
repeat('abab') == true
repeat('aba') == false
repeat('aabaaba') == false
repeat('abaababaab') == true
repat('abcabcabcabc') == true

D: input: string 
   intermed: array to hold substrings
   output: boolean
   
A:
  - define method repeat to take one parameter
  - intialize a leading substrings array = []
  - starting with first char of string...
    - generate all leading substrings, push to array 
  - iterate through array of leading substrings
  - select substring if substring * n is equal to input string
  - n = string size / substring size 
  - return true if substring * n == string
  - false otherwise
  
C:
=end

# def repeat(str)
#   leading_substrings = []
#   1.upto(str.size / 2) do |substring_size|
#     if (str.size % substring_size == 0)
#       leading_substrings << str[0, substring_size]
#     end 
#   end 
  
#   leading_substrings.each do |subs|
#     multiplier = str.size / subs.size
#     return true if subs * multiplier == str
#   end
#   false
# end 
    
# p repeat('ababab') == true
# p repeat('abab') == true 
# p repeat('aba') == false
# p repeat('aabaaba') == false
# p repeat('abaababaab') == true
# p repeat('abcabcabcabc') == true 
# require 'pry'
# def pangram?(str)
# letters = ('a'..'z').to_a

# included_in_string = []

# 26.times do 
#   included_in_string << false
# end 

# letter_state_hash = letters.zip(included_in_string).to_h
  
# letters.each do |letter| 
#   if str.downcase.include?(letter)
#     letter_state_hash[letter] = 'true' 
#   end 
# end 
  
# return true if letter_state_hash.values.all? { |bool| bool == 'true' }

# false
 
# end  
# # p pangram?("The quick brown fox jumps over the lazy dog.")

# # p pangram?('Cwm fjord bank glyphs vext quiz!')
# def pangram?(str)
# letters = ('a'..'z').to_a

# included_in_string = []

# 26.times do 
#   included_in_string << false
# end 

# letter_state_hash = letters.zip(included_in_string).to_h
  
# letters.each do |letter| 
#   if str.downcase.include?(letter)
#     letter_state_hash[letter] = 'true' 
#   end 
# end 
  
# return true if letter_state_hash.values.all?

# false

# end 

# p pangram?("The quick brown fox jumps over the lazy dog.")
# p pangram?("fuzzy fella")

# Complete the solution so that it returns true if the first argument(string) passed in ends with the 2nd argument (also a string).



# P:
# - create method that returns true if the first argument (str) ends with the second argument. 
# - input: string1, string2
# - output: boolean
# - rules: 
#         - second argument determines matching length of first argument 
#             - ex. 'abc', 'bc' .. second argument (size 2) determines that last two chars of str1 must match to return true. 
#         - both arguments are strings 
# E:
# solution('abc', 'bc') // returns true
# solution('abc', 'd') // returns false

# D: input: str
#   intermed: str/array?
#   output: boolean
   
# A:
# - define method solution to take two params (strings)
# - check size of second argument 
# - slice end section of first argument to capture as many chars as determined by second arg.size
# - compare this substring to second arg
# - return true if matches


# def solution(str_1, str_2)
#   return true if str_2.empty?
#   start_index = -(str_2.size)
#   ending_substring = str_1[start_index..-1]
#   ending_substring == str_2
# end 

# solution('fish', 'is')
# p solution('fish', '')

# def solution(str1, str2)
#   str1.end_with?(str2)
# end 

