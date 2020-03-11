class BankAccount
  attr_reader :balance

  def initialize(starting_balance=0)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class AccountProxy
  def initialize(real_account)
    @subject = real_account
  end

  def method_missing(name, *args)
    puts "Delegating #{name} message to subject."
    @subject.send(name, *args)
  end
end

account_proxy = AccountProxy.new(BankAccount.new(100))
puts "Current account balance is #{account_proxy.balance}."
account_proxy.deposit(50)
puts "Current account balance is #{account_proxy.balance}."
account_proxy.withdraw(100)
puts "Current account balance is #{account_proxy.balance}."