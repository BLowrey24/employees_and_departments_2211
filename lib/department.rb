class Department
  attr_reader :name, :employees, :expences

  def initialize(name)
    @name = name
    @employees = []
    @expences = 0
  end

  def hire(employee)
    employees << employee
  end

  
end