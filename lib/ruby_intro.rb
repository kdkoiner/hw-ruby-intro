# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  num = 0
  for element in arr do
    #this next line causes a warning in ruby 2.4.1, fixed in later version
    num = num + element 
  end
  return num
end

def max_2_sum arr
  
  if arr.length == 0
    return 0
  end
  
  if arr.length == 1
    return arr[0]
  end

=begin  
  I sort array in ascending order
  # and then reverse the array so that 
  #the 2 largest numbers are at the front
=end
  sorted_arr = arr.sort.reverse

  max1 = sorted_arr[0]
  max2 = sorted_arr[1]
  
  return max1 + max2
end

def sum_to_n? arr, n
  
  if arr.length == 0
    return false
  end
  
  if arr.length == 1
    return false
  end

=begin  
  Nested for loop comparing each possible sum
  of 2 elements in the array to n
=end
  for i in 0..arr.length - 1
    j = i + 1
    for j in j..arr.length - 1
      element1 = arr[i]
      element2 = arr[j]
      if (element1 + element2 == n)
        return true
      end
    end
  end
  
  return false
end

# Part 2

def hello(name)
  return greeting = "Hello, " + name
end

def starts_with_consonant? s

=begin    
  /../i turns off case sensitivity
  /^../ inverts the regex string
  =~ is the regex pattern-matching operator
=end

  #If the 1st char in s is not a letter
  #return false
  if s[0] =~ /[^a-z]/i
    return false
  end
  
  #If the 1st char in s is not a vowel
  # return true
  if s[0] =~ /[^aeiou]/i
    return true
  else
    return false
  end
  
end

def binary_multiple_of_4? s
  
  #check for empty string
  if s.length == 0
    return false
  end
  
  #Split string into Array
  arr = s.split('')
  
  #Prove the string is a valid binary num
  for digit in arr do
    if (digit != "0" && digit != "1")
      return false
    end
  end
  
  #convert binary string to decimal number
  val = s.to_i(2)
  
  #check if val is multiple of 4
  if (val % 4 == 0)
    return true
  else
    return false
  end
end

# Part 3

class BookInStock
  
  #constructor
  def initialize(isbn, price)
    
    #if price is 0 or negative
    #raise error
    if (price <= 0)
      raise ArgumentError
    end
    
    #if isbn is empty
    #raise error
    if (isbn.length == 0)
      raise ArgumentError
    end
    
    @isbn = isbn 
    @price = Float(price)
    
  end
  
  #Getters & Setters
  attr_accessor :isbn, :price
  
  #price_as_string method
  def price_as_string
    
    string_price = "$" + price.to_s 

=begin    
    price was converted to a float in the constructor
    so that every price will have at least 1 
    decimal place.
    So now, I check to see if the string_price
    has 2 decimal places or 1.
    If it has 2, then the string is returned.
    If it has 1, then a 0 is added to the end,
    and then the string is returned.
    To do this, I check to see if the 
    3rd to last char is a decimal, which would
    mean that there are 2 digits after it.
=end    
    
    if string_price[string_price.length - 3] == "."
      return string_price
    else
      string_price = string_price + "0"
      return string_price
    end
  end
  
end