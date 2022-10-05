# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.inject(0, :+)# YOUR CODE HERE
end

def max_2_sum arr
  return 0 if arr.empty?
  return arr.first if arr.length == 1
  arr.max(2){ |a, b| a<=>b}.reduce(:+)
  # YOUR CODE HERE
end

def sum_to_n? arr, n
  return false if arr.empty? && n.zero?
  arr.combination(2).any? {|a, b| a + b == n }
  # YOUR CODE HERE
end

# Part 2

def hello(name)
  return "Hello, " + name
  # YOUR CODE HERE
end

def starts_with_consonant? s
  return s =~ /\A(?=[^aeiou])(?=[a-z])/i
  # YOUR CODE HERE
end

def binary_multiple_of_4? s
  return true if (s) == "0"
  return true if s=~/^[01]*(00)$/
end

# Part 3

class BookInStock
# YOUR CODE HERE

  def initialize (isbn, price)
    
    @isbn = isbn
    @price = price
    raise ArgumentError if @isbn == "" || @price <= 0
  end

  def isbn
    @isbn
  end

  def price
    @price
  end

  def isbn=(new_amount)
    raise ArgumentError if new_amount == ""
    @isbn = new_amount
  end

  def price=(new_amount)
    raise ArgumentError if new_amount <= 0
    @price = new_amount
  end

  def price_as_string
    "$#{'%.2f' %  @price}"
  end

end
