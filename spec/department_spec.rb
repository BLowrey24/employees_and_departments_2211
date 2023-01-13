require './lib/employee'
require './lib/department'

RSpec.describe Employee do
  let(:customer_service) { Department.new("Customer Service") }

  describe '#initialize' do
    it 'exists' do
      expect(customer_service).to be_a(Department)
    end
  end
end