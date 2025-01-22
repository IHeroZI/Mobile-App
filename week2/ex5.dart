class BankAccount {
  String _accountNumber;
  String _accountHolder;
  double _balance;

  BankAccount(this._accountNumber, this._accountHolder, this._balance);

  String get accountNumber => _accountNumber;
  String get accountHolder => _accountHolder;
  double get balance => _balance;

  set accountHolder(String newHolder) {
    _accountHolder = newHolder;
    print("Account Holder updated to: $_accountHolder");
  }

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print(
          "Deposited \$${amount.toStringAsFixed(2)}. New Balance: \$${_balance.toStringAsFixed(2)}");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print(
          "Withdrew \$${amount.toStringAsFixed(2)}. New Balance: \$${_balance.toStringAsFixed(2)}");
    } else {
      print(
          "Insufficient funds. Cannot withdraw \$${amount.toStringAsFixed(2)}.");
    }
  }

  /*void displayAccountInfo() {
    print("Account Holder: $_accountHolder");
    print("Account Number: $_accountNumber");
    print("Balance: \$${_balance.toStringAsFixed(2)}");
  }*/
}

void main() {
  var account = BankAccount('0658971562', 'Hero Eiei', 500.00);
  print("Account Holder: ${account.accountHolder}");
  print("Account Number: ${account.accountNumber}");
  print("Balance: \$${account.balance.toStringAsFixed(2)}");
  account.accountHolder = 'Jay Jo';
  account.deposit(200.00);
  account.withdraw(300.00);
  account.withdraw(500.00);
}
