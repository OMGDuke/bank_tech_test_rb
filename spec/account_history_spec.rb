require 'account_history'

describe AccountHistory do
	subject(:account_history) {described_class.new}
  let (:transaction) {double :transaction, amount: 50, date:'27/06/2016' }

	describe '#initialize' do
		it 'initialized with an empty array' do
			expect(account_history.transactions).to eq([])
	  end
	end

  describe '#new_transaction'
  it 'adds a new transaction' do
    account_history.new_transaction(transaction)
    expect(account_history.transactions).to eq([transaction])
  end
end
