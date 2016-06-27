require 'transaction'

describe Transaction do
  subject(:transaction) {described_class.new(5, '27/06/16')}

	describe '#initialize' do
		it 'initializes with an amount' do
			expect(transaction.amount).to eq(5)
	  end

    it 'initializes with date' do
      expect(transaction.date).to eq('27/06/16')
    end
	end
end
