require './lib/account_history.rb'

class Account

	def initialize(account_history = AccountHistory)
		@balance = 0
    @account_history = account_history.new
	end

  def balance
    @account_history.transactions.each do |transaction|
      @balance += transaction.amount
    end
    @balance
  end

  def process_transaction transaction 
    @balance += transaction.amount
    @account_history.new_transaction transaction
  end

  def print_statement
    @statement = "date || credit || debit || balance\n"
    statement_creator
    return @statement[0...-1]
  end

  private
  def statement_creator
    @statement_balance = @balance
    @account_history.transactions.reverse.each do |transaction|
      new_line transaction
    end
  end

  def new_line transaction
    if transaction.amount < 0
      @statement += "#{transaction.date} || || #{transaction.amount * -1} || #{@statement_balance}\n"
      @statement_balance -= transaction.amount
    else
      @statement += "#{transaction.date} || #{transaction.amount} || || #{@statement_balance}\n"
      @statement_balance -= transaction.amount
    end
  end
end
