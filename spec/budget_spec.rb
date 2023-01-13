require './lib/budget'
require './lib/employee'
require './lib/department'

RSpec.describe Budget do
let(:budget) {Budget.new(2022)}
let(:customer_service) { Department.new("Customer Service") }


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
    end
  end
end