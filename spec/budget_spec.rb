require './lib/budget'
require './lib/employee'
require './lib/department'

RSpec.describe Budget do
let(:budget) {Budget.new(2022)}

let(:customer_service) { Department.new("Customer Service") }
let(:front_office) { Department.new("Front Office") }
let(:emergency_services) { Department.new("Emergency Services") }

let(:bobbi) { Employee.new( { name: "Bobbi Jaeger", age: "30", salary: "$100000" } ) }
let(:aaron) { Employee.new( { name: "Aaron Tanaka", age: "25", salary: "$90000" } ) }
let(:boston) { Employee.new( { name: "Boston Lowrey", age: "19", salary: "$80000" } )}


  describe '#initialize' do
    it 'exists' do
      expect(budget).to be_a(Budget)
    end

    it 'has attributes' do
      expect(budget.year).to eq(2022)
      expect(budget.departments).to eq([])
    end
  end

  describe '#add_department' do
    it 'can add departments' do
      budget.add_department(customer_service)

      expect(budget.departments).to eq([customer_service])

      budget.add_department(front_office)
      budget.add_department(emergency_services)

      expect(budget.departments).to eq([customer_service, front_office, emergency_services])
    end
  end

  describe '#departments_under_budget' do
    it 'can list all departments with expenses less than $500' do
      budget.add_department(customer_service)
      budget.add_department(front_office)
      budget.add_department(emergency_services)
      
      customer_service.expense(125)
      front_office.expense(600)
      emergency_services.expense(500)

      expect(budget.departments_under_budget).to eq([customer_service])
    end
  end

  describe '#employee_salaries' do
    it 'can list all employee salaries' do
      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      
      budget.add_department(customer_service)
  
      # expect(budget.employee_salaries).to eq([100000,90000])
      expect(budget.employee_salaries).to eq({
        "Bobbi Jaeger" => 100000,
        "Aaron Tanaka" => 90000
      })
require 'pry'; binding.pry
      front_office.hire(boston)

      budget.add_department(front_office)

      # expect(budget.employee_salaries).to eq([100000,90000,80000])
      require 'pry'; binding.pry
      expect(budget.employee_salaries).to eq({
        "Bobbi Jaeger" => 100000,
        "Aaron Tanaka" => 90000,
        "Boston Lowrey" => 80000
      })
    end
  end
end