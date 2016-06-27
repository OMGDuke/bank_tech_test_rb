require 'account'

describe Account do
	subject(:account) {described_class.new}
  let (:deposit) {double :deposit, amount: 50, date:'27/06/2016' }
  let (:withdrawal) {double :withdrawal, amount: -25, date: '28/06/2016' }



	describe '#initialize' do
		it 'has a default balance of £0' do
			expect(account.balance).to eq(0)
	  end
	end

  describe '#process_transaction' do
    it 'can receive a deposit' do
      account.process_transaction(deposit)
      expect(account.balance).to eq(50)
    end

    it 'can receive a withdrawal' do
      account.process_transaction(deposit)
      account.process_transaction(withdrawal)
      expect(account.balance).to eq(25)
    end
  end
end
