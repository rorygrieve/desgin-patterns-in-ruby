class Account
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(other)
    balance <=> other.balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

my_portfolio = Portfolio.new
account_1 = Account.new("Sam", 10_000)
account_2 = Account.new("Steve", 20_000)
account_3 = Account.new("Natasha", 15_000)

my_portfolio.add_account(account_1)
my_portfolio.add_account(account_2)
my_portfolio.add_account(account_3)

# puts my_portfolio.any? { |account| account.balance > 19_000 }
# puts my_portfolio.all? { |account| account.balance > 19_000 }

obj1 = 'Hello world!'

collection1 = [obj1, 42]
collection2 = Array.new(collection1)

puts collection1.first.object_id # => 70092096927380
puts collection2.first.object_id # => 70092096927380

obj1 = "fsdfsd"

puts obj1              # => "Hello\tworld!"
puts collection1.first # => "Hello\tworld!"
puts collection2.first # => "Hello\tworld!"
