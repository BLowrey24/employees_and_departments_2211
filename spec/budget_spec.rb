require './lib/budget'
require './lib/employee'
require './lib/department'

RSpec.describe Budget do
let(:budget) {Budget.new(2022)}

  describe '#initialize' do
    it 'exists' do
      expect(budget).to be_a(Budget)
    end

    it 'has attributes' do
      expect(budget.year).to eq(2022)
      expect(budget.departments).to eq([])
    end
  end
end