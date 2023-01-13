require './lib/employee'

RSpec.describe Employee do

  describe '#initialize' do
    it 'exists' do
      bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})

      expect(bobbi).to be_a(Employee)
    end
  end
end