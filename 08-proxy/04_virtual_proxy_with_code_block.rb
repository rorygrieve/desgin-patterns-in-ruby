class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class VirtualAccountProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def deposit(amount)
    s = subject
    return s.deposit(amount)
  end

  def withdraw(amount)
    s = subject
    return s.withdraw(amount)
  end

  def balance
    s = subject
    return s.balance
  end

  def subject
    @subject || (@subject = @creation_block.call)
  end
end

virtual_account_proxy = VirtualAccountProxy.new { BankAccount.new(100) }
puts virtual_account_proxy.balance
puts virtual_account_proxy.withdraw(40)