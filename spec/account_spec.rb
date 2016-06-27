require 'account'

describe Account do
	subject(:account) {Account.new}

	describe '#initalize' do
		it 'has a default balance of £0' do
			expect(account.balance).to eq(0)
	  end
	end
end
