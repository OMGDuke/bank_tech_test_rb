class AccountHistory
	attr_reader :transactions

	def initialize
		@transactions = []
	end

  def new_transaction transaction
    @transactions << transaction
  end
end
