
import 'dart:math';

 String generateStrongPassword() {

  int length = 8;
  List<String> omittedChars = ['\\'];
  if (length < 6) {
    throw ArgumentError("Password length must be at least 6 to guarantee requirements.");
  }

  length = length  <= 6 ? 8 : length;
  
  final random = Random();
  final numericChars = '0123456789'.split('');
  final uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
  final specialChars = r'!@#$%^&*()_+=-`~[]\{}|;:,.<>?'.split('');

  List<String> availableNumeric =
      numericChars.where((char) => !omittedChars.contains(char)).toList();
  List<String> availableUppercase =
      uppercaseChars.where((char) => !omittedChars.contains(char)).toList();
  List<String> availableSpecial =
      specialChars.where((char) => !omittedChars.contains(char)).toList();
  List<String> availableAll = [
    ...availableNumeric,
    ...availableUppercase,
    ...availableSpecial,
    ...('abcdefghijklmnopqrstuvwxyz'.split('')
        .where((char) => !omittedChars.contains(char))),
  ];

  if (availableNumeric.isEmpty ||
      availableUppercase.isEmpty ||
      availableSpecial.isEmpty ||
      availableAll.isEmpty) {
    throw StateError("Not enough available characters after omitting.");
  }

  List<String> password = [];

  // Ensure at least 2 numbers
  for (int i = 0; i < 2; i++) {
    password.add(availableNumeric[random.nextInt(availableNumeric.length)]);
  }

  // Ensure at least 1 uppercase letter
  password.add(availableUppercase[random.nextInt(availableUppercase.length)]);

  // Ensure at least 1 special character
  password.add(availableSpecial[random.nextInt(availableSpecial.length)]);

  // Fill the rest of the password with random characters
  while (password.length < length) {
    password.add(availableAll[random.nextInt(availableAll.length)]);
  }

  // Shuffle the password to make the required characters less predictable
  password.shuffle(random);

  return password.join();
}