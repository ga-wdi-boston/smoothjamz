require 'pry'

class Stockman
  attr_reader :name # only read
  attr_writer :password # only write
  attr_accessor :portfolio, :profile_picture   # creates read and write methods

  def initialize
    @portfolio = {}
    @name = "phil"
    @password = 1234
    @gender = Stockman.gender
  end

  def Stockman.gender
    # class method returns a random gender
    ['male', 'female'].sample
  end

  # def portfolio
  #   # returns the instance variable
  #   @portfolio
  # end

  # def portfolio=(stock_name)
  #   # let's us set the instance variable
  #   @portfolio = stock_name
  # end

end

class Stock
  attr_accessor :shares, :price
  def initialize(symbol, price, shares)
    @symbol = symbol
    @price = price
    @shares = shares
  end

  def total
    # have a function return the sum of two instance variables
    @price * @shares
  end

  def Stock.get_price(ticker)
    # Why create a stock object to get the price of a stock?
    # a class method to get the price of a stock
    # pseudo code
    # yahoo::finance.get_price(ticker)
  end
end

p1 = Stockman.new

p1.portfolios[:tech] = [] # creates an empty array in the portfolios hash

s1 = Stock.new('AAPL', 50, 100)
s2 = Stock.new('IBM', 100, 35)
p1.portfolio[:tech] = [s1, s2]

total_value = 0

p1.portfolio[:tech].each do |stock|
  # using the object's instance variables
  # total_value = total_value + stock.price * stock.shares
  # using an object's method
  # total_value = total_value + stock.total
  total_value += stock.total # += shorthand to update total
end

puts total_value

binding.pry