require 'account'

describe Account do
  let (:deposit) {double :deposit, amount: 50, date:'27/06/2016' }
  let (:withdrawal) {double :withdrawal, amount: -25, date: '28/06/2016' }
  let(:account_history) { double :account_history, new_transaction: true }
  let(:account_history_class) { double :account_history_class, new: account_history }
	subject(:account) {described_class.new(account_history_class)}

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

    it 'adds the transaction to the history' do
      expect(account_history).to receive(:new_transaction).with(deposit)
      account.process_transaction(deposit)
    end
  end

  describe '#print_statement' do
    it 'prints a statement' do
      statement = ''
      expect(account.print_statement).to eq(statement)
    end
  end
end
