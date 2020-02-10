require 'observer'

class Payroll
  def update( changed_employee )
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class TaxMan
  def update( changed_employee )
    puts("Send #{changed_employee.name} a new tax bill!")
  end
end

class Employee
  include Observable

  attr_reader :name, :address
  attr_reader :salary

  def initialize( name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
  end
end


fred = Employee.new('Fred', 'Crane Operator', 30000)

payroll = Payroll.new
fred.add_observer(payroll)

tax_man = TaxMan.new
fred.add_observer(tax_man)

fred.salary = 35000