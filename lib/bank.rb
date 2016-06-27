require './lib/transaction.rb'

class Bank

	def initialize(transaction_class=Transaction)
		@transaction_class = transaction_class
	end

  def deposit(account, amount)
    fail 'You cannot deposit a negative amount' if amount < 0
    transaction = @transaction_class.new(amount, DateTime.now)
    account.process_transaction transaction
  end

  def withdraw(account, amount)
    fail 'You cannot withdraw a negative amount' if amount < 0
    deduction_amount = amount * -1
    transaction = @transaction_class.new(deduction_amount, DateTime.now)
    account.process_transaction transaction
  end

  def balance account
    account.balance
  end

  def print_statement account
    account.print_statement
  end
end
