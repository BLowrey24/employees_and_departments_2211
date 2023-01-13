class Department
  attr_reader :name, :emplyees

  def initialize(name)
    @name = name
    @employees = []
  end
end