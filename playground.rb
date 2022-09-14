class Employee
  attr_reader :name, :serial_number, :vacation_days, :type, :desk
  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
    @type = self.class
    @vacation_days = 0
    @desk = ''
  end

  def to_s
    puts "Name: #{name}"
    puts "Type: #{type}"
    puts "Serial Number: #{serial_number}"
    puts "Vacation Days: #{vacation_days}"
    "Desk: #{desk}"
  end
end

class PartTimeEmployee < Employee
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 0
    @desk = "Unreserved in open workspace"
  end
end

class FullTimeEmployee < Employee
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 10
    @desk = "In cubicle farm"
  end

  def take_vacation
    # takes vacation
  end
end

class Manager < FullTimeEmployee
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 14
    @desk = "Private office"
  end

  def delegate(employee)
    # delegate employee
  end
end

class Executive < Manager
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation_days = 20
    @desk = "Corner office"
  end

  def hire(employee)
    # hire employee
  end

  def fire(employee)
    # fire employee
  end
end

puts PartTimeEmployee.new("part", 123) # Name: part, Type: PartTimeEmployee, Serial Number: 123, Vacation Days: 0, Desk: Unreserved in open workspace
