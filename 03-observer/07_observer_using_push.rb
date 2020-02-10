class Payroll
  def update( salary, name )
    puts("Cut a new check for #{name}!")
    puts("His salary is now #{salary}!")
  end
end

class TaxMan
  def update( salary, name )
    puts("Send #{name} a new tax bill!")
  end
end

class BusinessCardPrinting
  def update(name)
    puts("Print a new set of business cards for #{name}!")
  end
end

module SalaryObservable
  def initialize
    @salary_observers=[]
  end

  def add_salary_observer(observer)
    @salary_observers << observer
  end

  def delete_salary_observer(observer)
    @salary_observers.delete(observer)
  end

  def notify_salary_observers
    @salary_observers.each do |salary_observer|
      salary_observer.update(name, salary)
    end
  end
end

module NameObservable
  def initialize
    @name_observers = []
  end

  def add_name_observer(observer)
    @name_observers << observer
  end

  def delete_name_observer(observer)
    @name_observers.delete(observer)
  end

  def notify_name_observers
    @name_observers.each do |name_observer|
      name_observer.update(name)
    end
  end
end

class Employee
  include SalaryObservable, NameObservable

  attr_reader :name, :title
  attr_reader :salary
  def initialize( name, title, salary)
    SalaryObservable.instance_method(:initialize).bind(self).call
    NameObservable.instance_method(:initialize).bind(self).call
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_salary_observers
  end

  def name=(new_name)
    @name = new_name
    notify_name_observers
  end
end


fred = Employee.new('Fred', 'Crane Operator', 30000)

payroll = Payroll.new
fred.add_salary_observer(payroll)

tax_man = TaxMan.new
fred.add_salary_observer(tax_man)

business_card_printing = BusinessCardPrinting.new
fred.add_name_observer(business_card_printing)

fred.salary = 35000
fred.salary = 90000

fred.name = "Steve"

