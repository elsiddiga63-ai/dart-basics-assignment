// Student: Ahmed Elsiddig
// Reg no: 26034
const String regNo = '26034';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Part F: Format an integer with comma separators and the RWF suffix.
String formatRwf(int amount) {
  // by AE
  final bool isNegative = amount < 0;
  final String digits = amount.abs().toString();
  String formatted = '';
  int i = 0;

  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      formatted += ',';
    }
    formatted += digits[i];
    i++;
  }

  if (isNegative) {
    formatted = '-$formatted';
  }

  return '$formatted RWF';
}

// Part F: Check all rules for a five-character MoMo PIN.
bool isValidPin(String pin) {
  // by AE
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;
  while (i < pin.length) {
    final int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) {
      return false;
    }
    i++;
  }

  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4]) {
    return false;
  }

  return true;
}

// Part F: Return the new balance after sending money and paying the fee.
int sendMoney(int balance, int amount) {
  // by AE
  final int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  final int newBalance = balance - amount - fee;
  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

// Part F: Buy airtime without a transaction fee.
int buyAirtime(int balance, int amount) {
  // by AE
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  final int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// Copy of the D2 MoMo fee function.
int momoFee(int amount) {
  // by AE
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

void main() {
  // by AE
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. PIN checks requested in the assignment.
  print("PIN 12345: ${isValidPin('12345')}");
  print("PIN 77777: ${isValidPin('77777')}");
  print("PIN 4821: ${isValidPin('4821')}");
  print("PIN 48a21: ${isValidPin('48a21')}");
  print("PIN 4821$d: ${isValidPin('4821$d')}");

  // 2. Starting balance = 20,000 + T * 500.
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. Make the requested transactions in order.
  final int sendAmount = (d + 1) * 3000;
  int i = 1;
  while (i <= 3) {
    balance = sendMoney(balance, sendAmount);
    i++;
  }

  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. Final balance.
  print('Final balance: ${formatRwf(balance)}');

  // 5. Extra tests: expected output is written beside every test call.
  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(999)); // Expected: 999 RWF
  print(formatRwf(1000)); // Expected: 1,000 RWF
  print(formatRwf(-5000)); // Expected: -5,000 RWF
  print(isValidPin('48214')); // Expected: true
  print(isValidPin('11111')); // Expected: false
}
