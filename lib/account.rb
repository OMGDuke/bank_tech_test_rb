require './lib/account_history.rb'

class Account
	attr_reader :balance

	def initialize(account_history = AccountHistory)
		@balance = 0
    @account_history = account_history.new
	end

  def process_transaction(transaction)
    @balance += transaction.amount
    @account_history.new_transaction(transaction)
  end

  def print_statement
    statement = "date || credit || debit || balance\n"
    statement_balance = @balance
    @account_history.transactions.reverse.each do |transaction|
      if transaction.amount < 0
        statement += "#{transaction.date} || || #{transaction.amount * -1} || #{statement_balance}\n"
        statement_balance -= transaction.amount
      else
        statement += "#{transaction.date} || #{transaction.amount} || || #{statement_balance}\n"
        statement_balance -= transaction.amount
      end
    end
    return statement[0...-1]
  end
end
