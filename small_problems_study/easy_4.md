1. Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

P: 
  - method takes two strings as arguments
  - determines longest of two strings
  - returns result of concatenating strings..short + long + short
  - assume strings are of different lengths
  - input: two strings
  - output: concatenated new string- short + long + short
  - rules: assume strings passed in are two different lengths
  - clarification: what if strings are multiple words? spaces?

E: 
```ruby 
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
```

D: strings

A: 
  - define method to take two parameters (strings)
  - determine length of first string # str.length
  - determine length of second string
  - concatenate strings based on length 
  -   short_str + long_str + short_str
  - return new string

C:
```ruby
def short_long_short(str_1, str_2)
  if str_1.length > str_2.length 
    str_2 + str_1 + str_2
  elsif str_1.length < str_2.length
      str_1 + str_2 + str_1
  end 
end 
```

2. Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

P: 
  - method takes year as input
  - returns string containing century with appropriate suffix
  - input: year (integer)
  - output: string- century number with appropriate suffix 
  - rules: new centuries begin in years that end with `01`
  -   ex. years 1901-2000 comprise the 20th century. 
  - clarification: default for non-integer entries?

E: 
```ruby
century(2000) == `'20th'`
century(2001) == `'21st'`
century(1965) == `'20th'`
century(5) == `'1st'` 
century(10103) == `'102nd'` 
```
01-100 : 1st
101-200 : 2nd
201-300 : 3rd
301-400 : 4th
401-500 : 5th
901-1000 : 9th
1901-2000 : 20th

suffixes 
1 .. st
2 .. nd 
3 .. rd 
4 .. th 


D: 

A: 
  - define method century to accept one parameter (integer)
  - convert year (input) to century using year/100 + 1
  -   or if multiple of 100 simply year/100 
  - convert to string and save to local variable
  - check which suffix would be appropriate for year 
  - add suffix to century string
  - return century + suffix string 

C: 
```ruby
def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end 

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10
  
  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end 
end 
```

3. Write method that takes any year greater than 0 as input, return `true` if the year is a leap year, `false` if not a leap year. 

P:
  - determine if input year is a leap year
  - output true or false
  -input: integer > 0 
  - output: boolean 
  - rules: leap year if...
  -   - evenly divisible by 4..unless also divisible by 100 
  -   if evenly divisible by 100, not leap year unless
  -     year evenly divisible by 400. 

E: 
```ruby
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
```

D: 

A: 
  - define method to take one parameter (int greater than 0)
  - check to see if year is evenly divisible by 4
  -   if yes, check to see if also divisible by 100
  -     if no, return true
  -     if yes, check if year divisible by 400
  -       if no, false
  -       if yes, true
  - return boolean 

C: 
```ruby 
def leap_year?(year)
  if year % 400 == 0 
    return true
  elsif year % 100 == 0 
    return false 
  elsif year % 4 == 0 
    return true
  end 
  false 
end 
```
or 
```ruby
def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0 
    return true 
  elsif year % 4 == 0 && year % 100 == 0
    year % 400 == 0
  else
    false
  end 
end 
```

4. The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine leap years both before and after 1752.

```ruby
def julian_leap_year?(year)
  year % 4 == 0 
end 

def greg_leap_year?(year)
  if year % 4 == 0 && year % 100 != 0 
    return true 
  elsif year % 4 == 0 && year % 100 == 0
    year % 400 == 0
  else
    false
  end 
end 

def leap_year?(year)
  if year < 1752 
    julian_leap_year?(year)
  else 
    greg_leap_year?(year)
  end 
end 
```
or not using helper methods..
```ruby
def leap_year?(year)
  if year < 1752 && year % 4 == 0
    true
  elsif year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end
```

5. Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

P: 
  - given an integer greater than 1
  - search for all multiples of 3 or 5 between 1 and given number 
  - compute sum of multiples 
  - output sum 
  - input: integer greater than 1 
  - output: integer (sum of multiples)
  - rules: input will be integer greater than 1
  - clarification: if none, return 0?

E: 
```ruby
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
```

D: arrays to push multiples into before summing

A: 
  - define method multisum to take one parameter (integer)
  - initialize empty array to hold multiples 
  - iterate from 1 to given number
  -   select multiples of 3 or 5 and add to array 
  - sum array elements
  - return sum 

C: 
```ruby
def multisum(num)
  multiples = []
  
  (1..num).each do |int|
    multiples << int if int % 3 == 0 || int % 5 == 0 
  end 
  multiples.inject(:+)
end 
```

6. Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

P:
  - method takes array of numbers 
  - returns array with same number of elements
  - each element is running total from original array 
  -   ex [1, 2, 3] == [1, 3, 6]
  - input: array of integers
  - output: array of integers (same size) integers running total
  - rules: same size as input array, with each element sum of self +        ``preceeding number

E: 
```ruby 
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
```
[2, 5, 7] == [2, (2+5) == 7, 7 + 7 == 14  ] == [2, 7, 14]

D: arrays

A: 
  - define method to take one param (arr)
  - transform input array to output new array 
  -   map? 
  -   create local var, saved num, increment saved num to new num 
  -   each element in new array sum of self and previous num 
  - output new array 

C: 
```ruby 
def running_total(arr)
  saved_num = 0
  new_arr = []
  
  arr.each do |num|
    new_arr << num + saved_num 
    saved_num += num 
  end 
  new_arr
end 
```
or
```ruby
def running_total(arr)
  sum = 0
  arr.map do |value|
    sum += value
  end 
end 
```
or
```ruby
def running_total(arr)
  total = 0 
  new arr = arr.inject([]) do |array, item|
    array << total += item 
  end 
  new_arr 
end 
```

7. You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

P: 
  - given string of numbers
  - manually convert string to integer
  - return integer 
  - input: string of numbers
  - output: integer
  - rules: may not use Ruby methods (to_i, to_s, etc)

E: 
```ruby 
string_to_integer('4321') == 4321
string_to_integer('570') == 570
```

D: hash to store digit string/integer key value pairs
   array to iterate through string characters
   
A: 
  - create hash (keys = strings/ values = integers)
  - create empty array to save string characters 
  - iterate through string characters..see which are inlcuded in hash
  - if key found in hash, return value to new array
  - join new array 
  - 
C:
```ruby
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  digits = str.chars.map do |char|
    DIGITS[char]
  end 
  
  value = 0 
  digits.each do |dig|
    value = 10 * value + dig
  end 
  value 
end
```

8. Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

```ruby
def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end 
end
```

9. Write a method that takes a positive integer or zero, and converts it to a string representation.

```ruby
def integer_to_string(int)
  int.digits.reverse.join
end 
```

10. In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

```ruby
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end
```

