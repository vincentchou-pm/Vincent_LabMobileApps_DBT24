class Account {
  double balance = 0.0;

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$${amount.toStringAsFixed(2)}');
  }

  void withdraw(double amount) {
    if (amount > balance) {
      print(
        'Insufficient funds. Current balance: \$${balance.toStringAsFixed(2)}',
      );
    } else {
      balance -= amount;
      print('Withdrew: \$${amount.toStringAsFixed(2)}');
    }
  }
}

void main() {
  Account myAccount = Account();
  double depositAmount = 150000.0;
  myAccount.deposit(depositAmount);

  double withdrawalAmount = 50000.0;
  myAccount.withdraw(withdrawalAmount);

  print('Final balance: \$${myAccount.balance.toStringAsFixed(2)}');
}
