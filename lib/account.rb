class Account
	attr_reader :balance

	def initialize
		@balance = 0
	end

  def process_transaction(transaction)
    @balance += transaction.amount
  end
end
