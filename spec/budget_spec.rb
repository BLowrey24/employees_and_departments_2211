require './lib/budget'
require './lib/employee'
require './lib/department'

RSpec.describe Budget do
let(:budget) {Budget.new(2022)}
let(:customer_service) { Department.new("Customer Service") }
let(:front_office) { Department.new("Front Office") }
let(:emergency_services) { Department.new("Emergency Services") }


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
end