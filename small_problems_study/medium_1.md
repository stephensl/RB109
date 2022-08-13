1. Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method `Array#rotate` or `Array#rotate!`` for your implementation.

P: 
  input: array 
  output: new array 
  rules: 
        - move first element to end of the array 
        - do not mutate original array
        - cannot use `rotate` method


E: 
```ruby
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7] 
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
```

D:
  - arrays

A:

-define method rotate_array that takes one param (array)
-starting at index 1, 
- select each element from index 1 to end of array 
- add first element to array 
- output array 

C:
```ruby
def rotate_array(array)
  array[1..-1] + [array[0]]
end 
```
or
```ruby
def rotate_array(arr)
  arr.map.with_index do |_, idx|
    idx += 1
    arr.size == idx ? arr[0] : arr[idx]
  end
end
```

Further exploration:
```ruby
def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end


def rotate_string(string)
  string_array = string.chars
  rotate_array(string_array).join
end 


def rotate_integer(integer)
  int_array = integer.to_s.chars
  rotate_array(int_array).join.to_i
end 
```



2. Write a method that can rotate the last n digits of a number. 

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.





P:
  input: two integers: number to rotate, number of digits 
  output: integer with digits rotated as assigned
  rules: 
        - if second argument 1, return input integer 
        - rotate n number of digits from end of input number 
        - n always positive integer 
        - based on second argument, rotating digit at (-n) to end of integer 
        


E:
```ruby
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

rotate_rightmost_digits(12345, 4) == 13452
```

D: arrays, integers

A: 
- define method with two params
- break input integer into individual digits 
- find digit at index -n (n is second argument).. 
- rotate digit at index[-n] to end of array 
- join array and convert back to integer  


C:















4. You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

P:
- input: 









