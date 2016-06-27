# Bank Tech Test

### Installation Instruction

Clone this Repo.
Run bundle
open irb or pry
Require bank and account
```
require './lib/bank'
require './lib/account'
```
Create a new Bank and account
```
bank_name = Bank.new
account = Account.new
```
***
### Available Commands
Check your balance
```
bank_name.balance(account)
```
Deposit an amount into the account
```
bank_name.deposit(account, 50)
```
Withdraw an amount from the account
```
bank_name.withdraw(account, 25)
```
Print your statement
```
bank_name.print_statement(account)
```
