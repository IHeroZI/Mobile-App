class BankAccount {
  String _accountNumber;
  String _accountHolder;
  double _balance;

  BankAccount(this._accountNumber, this._accountHolder, this._balance);

  String get accountNumber => _accountNumber;
  String get accountHolder => _accountHolder;
  double get balance => _balance;

  void set accountHolder(String accountHolder) {
    _accountHolder = accountHolder;
    print("Account Holder updated to: $_accountHolder");
  }
      

  void detail() {
    print(
        "Account Number : ${_accountNumber} \nAccount Holder : $_accountHolder \nMoney : \$${_balance}");
  }

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      print(
          "Insufficient funds. Cannot withdraw \$${amount.toStringAsFixed(2)}.");
    } else {
      _balance -= amount;
      print('Withdrawn: \$${amount}. Current balance: \$${_balance}');
    }
  }

  void deposit(double amount) {
    _balance += amount;
    print('Deposited: \$${amount}. Current balance: \$${_balance}');
  }
}

void main() {
  BankAccount kBank = BankAccount('123-132-9656', 'Rawipon Ponsarutwanit', 500);
  // kBank.detail();

  print("Account Holder: ${kBank.accountHolder}");
  print("Account Number: ${kBank.accountNumber}");
  print("Balance: \$${kBank.balance.toStringAsFixed(2)}");
  kBank.accountHolder = 'Chill Guy';
  kBank.deposit(200.00);
  kBank.withdraw(300.00);
  kBank.withdraw(500.00);
}