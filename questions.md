Questions to clarify for RB109 study:


- Manual looping vs iterators
  
    ```ruby
    arr = [1, 2, 3]
    counter = 0
    
    loop do 
      puts arr[counter]
      counter += 1
      break if counter == arr.size
    end 
    ```
    or 
    
    ```ruby 
    arr = [1, 2, 3]
    
    arr.each do |num|
      puts num 
    end 
    ```
    
    For assessment will we be asked to create manual iterations or are we able to use iterator methods?
    
    ** note return value.. in first loop, return value is nil (last line evaluated is ```break if``` statement.)
    return value when using ```each``` is original array. 



- Flowcharts/Pseudocode
  
    Will we need to build flowcharts? Should i be familiar with shapes/formal pseudocode keywords?

- Pass by Reference vs Pass by Value
  - What will we need to communicate about this?

- Mutating vs non-mutating methods
  - Do we need to know just the difference? (mutation alters the original object, vs returning a new object)



Nested iteration

  arr = [["1", "2", "3"], ["a", "b", "c"]]
  
  arr.map do |sub_arr|
    sub_arr.map do |elem|
      elem + "!"
    end 
  end 

Does inner map return new arrays with elements transformed.. then does outer map return new array based on return value of inner map block?
Outer map block didn't perform any action? What is return value of inner map vs outer map?   

>> def fix(value)
--   value = value.upcase!
--   value.concat('!')
-- end
=> :fix
>> s = 'hello'
=> "hello"
>> s.object_id
=> 70363946430440
>> t = fix(s)
=> "HELLO!"
>> s
=> "HELLO!"
>> t
=> "HELLO!"
>> s.object_id
=> 70363946430440
>> t.object_id
=> 70363946430440
This time, though we assigned a reference to value, 
we end up with both s and t referring to the same object. 
The reason for this is that String#upcase! returns a reference to its caller, value. 
Since the reference returned by value.upcase! is the same, albeit mutated, String we started with, the assignment effectively rebinds value back to the object it was previously bound to; nothing is mutated by the assignment.

# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

p sum_consecutives([1,1,7,7,3]) == [2,14,3]


`the` 









# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.



p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0


# You are given an array which contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

# You can asume there is never an empty array and there will always be an integer.

p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

the `select` method is an iterative method that passes each element to the block and creates a new collection consisting of elements that return a truthy value. 
ex. `[1, 2, 3].select { |num| num < 3 }`


the local variable `` is passed to the `` method and 