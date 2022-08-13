109 Written Assessment Study Guide: 

1. local variable scope, especially how local variables interact with method invocations with blocks and method definitions

    local variable scope is determined by where in the program the variable was initialized. 
    
    - method invocations with blocks
      
      ```ruby
      x = 15
      
      loop do 
        x += 30
        break
      end 
      
      puts x
      ```
      
      What will be output by ```puts x``` on the final line of this code?
      
      - This code demonstrates local variable scope in regard to method invocation with blocks. This code will output ```45``` and return ```nil```
        because local variable ```x``` was reassigned within the block on line 13. 
        
      - Variables initialized in the outer scope are accessible and able to be reassigned within the inner scope of a block. Changes to the value referenced by the 
        local variable passed into the block will be evident in the outer scope. 
        
    - local variable scope with method definitions
       
      ```ruby
      x = 15
      
      def a_method(param)
        x = 30
      end 
      
      a_method(x)
      
      puts x 
      ```
      
      What will be output by ```puts x``` on the final line of this code?
      
        - This code demonstrates local variable scoping rules in regard to method definitions. This code will output ```15``` and return ```nil```. 
        - Methods create their own scope and are unable to directly access local variables initialized outside the scope of the method definition. On line 35, we
          are not reassigning local variable ```x``` which was initialized on line 32. We are actually initializing a new variable ```x``` local to the method. As a 
          result, when we pass ```x``` to the ```puts``` method on line 40, ```15``` is output and nil is returned as we cannot access the variable ```x``` initialized
          within the method definition in the outer scope. 
        - We can only access local variables initialized in the outer scope within methods, if they are passed in as arguments to the method. 
      





2. mutating vs non-mutating methods, pass-by-reference vs pass-by-value

  What is a mutating method? 
    A method that invokes a destructive call. Some methods are mutating, meaning that they permanently alter the calling object. 
    
  What is a non-mutating method?
    A method that does not alter the original object upon which it was invoked. These methods return a new object rather than the original caller. 

  How do we know if a method mutates the argument?
    If an operation inside the method invokes a destructive call, unless reassignment occurs beforehand. 
    
  Pass by Reference vs Pass by Value
    When local variables are passed into methods as arguments, the operations that occur inside the method dictate whether or not we return a new object, or the
    original object. When a new object is returned, Ruby acts like it is passing by value, in that it is operating on a copy of the original object. When the original
    object is returned, Ruby acts like it is passing by reference to the original object. 
      
      
      

3.  working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Review the two lessons on these topics thoroughly.

    
    Define ```Enumerable#each``` method.
      The ```each``` method performs iteration on a collection and returns the original data set that the method was called on. Each element of the collection is passed
      to the block, and block return values are ignored as the original data set is returned. 
      
    Define ```Enumerable#map``` method. 
      The ```map``` method is an iterative method that utilizes the block return value to perform transformation on each element in the collection. ```map``` returns
      a new array, containing each element of the original data set transformed according to the return value of the block to which it was passed. 
      
    Define ```Enumerable#select``` method.
      The ```select``` method is an iterative method that utilizes the truthiness of the block's return value to return a new array. The new array consists of all 
      elements of the original data set that returned a truthy value as a result of being passed to the block. Each element is passed to the block, if the return value 
      of the block evaluates to ```true``` the element is included in the new array. If the return value of the block evaluates to ```false``` the element is not 
      included in the new array. 
      
    
    Strings
    
      Strings are not true collections- collections contain multiple objects while strings contain only a single object. Individual characters are not objects, but are
      part of the object that countains the string value. 
      
      Strings act like collections since you can access and assign each character individually. However, when you access a single character of the string with string
      element reference ```str[2]```, the return value is a brand new string. Each time you call ```str[2]``` it returns a new string. 
      
    Arrays
    
      Arrays are lists of elements that are ordered by index, where each element can be any object. Arrays use an integer-based index to maintain the order of its
      elements, and can be referenced using its index. 
    
    Hashes
      
      Data structure that uses key-value pairs where the key or the value can be any type of Ruby object. 
      


- variables as pointers

- puts vs return
- false vs nil and the idea of "truthiness"
- method definition and method invocation
- implicit return value of method invocations and blocks
- how the Array#sort method works