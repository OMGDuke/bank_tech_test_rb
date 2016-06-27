require 'bank'

describe Bank do

  let (:account) {double :account, balance: 1000 }

  describe '#deposit' do
    let (:deposit) {double :deposit, amount: 50, date:'27/06/2016' }
    let(:transaction_class) { double :transaction_class, new: deposit }
    subject(:bank) {described_class.new(transaction_class)}


    it 'can make a deposit' do
      expect(account).to receive(:process_transaction).with(deposit)
      bank.deposit(account, 50)
    end

    it 'raises an error if you try to deposit a negative amount' do
      expect{bank.deposit(account, -10)}.to raise_error('You cannot deposit a negative amount')
    end
  end

  describe '#withdraw' do
    let (:withdrawal) {double :deposit, amount: -50, date:'26/06/2016' }
    let(:transaction_class) { double :transaction_class, new: withdrawal }
    subject(:bank) {described_class.new(transaction_class)}

    it 'can make a withdrawal' do
      expect(account).to receive(:process_transaction).with(withdrawal)
      bank.withdraw(account, 25)
    end

    it 'raises an error if you try to withdraw a negative amount' do
      expect{bank.withdraw(account, -10)}.to raise_error('You cannot withdraw a negative amount')
    end
  end

  describe '#balance' do
    subject(:bank) {described_class.new()}
    it 'returns the account balance' do
      expect(bank.balance(account)).to eq(1000)
    end
  end
end
