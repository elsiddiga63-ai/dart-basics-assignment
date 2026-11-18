// Student: Ahmed Elsiddig
// Reg no: 26034
const String regNo = '26034';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count vowels, including capital letters.
int countVowels(String text) {
  // by AE
  final String lower = text.toLowerCase();
  const String vowels = 'aeiou';
  int count = 0;
  int i = 0;

  while (i < lower.length) {
    if (vowels.contains(lower[i])) {
      count++;
    }
    i++;
  }

  return count;
}

// B3: Return the first letter of every name in uppercase, followed by a dot.
String initials(String fullName) {
  // by AE
  final String cleaned = fullName.trim();
  if (cleaned.isEmpty) {
    return '';
  }

  final List<String> names = cleaned.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;

  while (i < names.length) {
    result += '${names[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

// C5: Draw a right-aligned triangle using * on odd rows and # on even rows.
void drawTriangle(int height) {
  // by AE
  if (height <= 0) {
    return;
  }

  int row = 1;
  while (row <= height) {
    String line = '';
    int spaces = height - row;
    int spaceCount = 0;

    while (spaceCount < spaces) {
      line += ' ';
      spaceCount++;
    }

    final String symbol = row.isOdd ? '*' : '#';
    int symbolCount = 0;
    while (symbolCount < row) {
      line += symbol;
      symbolCount++;
    }

    print(line);
    row++;
  }
}

// D2: Return the fictional MoMo transaction fee for an amount.
int momoFee(int amount) {
  // by AE
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// D2: Keep the first three and last two phone characters and mask the middle.
String maskPhone(String phone) {
  // by AE
  if (phone.length != 10) {
    return 'INVALID';
  }

  String masked = phone.substring(0, 3);
  int i = 0;
  while (i < phone.length - 5) {
    masked += '*';
    i++;
  }
  masked += phone.substring(phone.length - 2);
  return masked;
}

void main() {
  // by AE
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  const String fullName = 'Ahmed Elsiddig';
  print('$fullName has ${countVowels(fullName)} vowels');
  // The toLowerCase() line makes capital vowels count.

  // B3
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));
  // Trimming and splitting on one-or-more whitespace characters handles extra spaces.

  // C5: height = D + 3. The spaces on each row equal height minus the row number.
  drawTriangle(d + 3);
  drawTriangle(0); // Expected: no output.
  drawTriangle(-2); // Expected: no output.

  // D2
  const String phone = '0788123456';
  int totalFees = 0;
  int i = 1;

  while (i <= d + 3) {
    final int amount = i * 4000 + t * 100;
    final int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }

  print('Total fees: $totalFees RWF');
}
