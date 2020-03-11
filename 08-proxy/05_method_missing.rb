class TestMethodMissing
  def hello
    puts("Hello from a real method")
  end

  def method_missing(name, *args)
    puts("Warning, warning, unknown method called: #{name}")
    puts("Arguments: #{args.join(' ')}")
  end
end

test_missing_method = TestMethodMissing.new

test_missing_method.hello
test_missing_method.goodbye('cruel', 'world')

test_missing_method.send(:hello)
test_missing_method.send(:goodbye, 'cruel', 'world')


