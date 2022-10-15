import 'dart:math';

String generatePassword({
  required bool isWithLowercase,
  required bool isWithUppercase,
  required bool isWithNumbers,
  required bool isWithSpecial,
  required int numberCharPassword,
}) {
  String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
  String upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String numbers = "0123456789";
  String special = "@#=+!£\$%&?[](){}-_";

  String allowedChars = "";

  allowedChars += (isWithLowercase ? lowerCaseLetters : '');
  allowedChars += (isWithUppercase ? upperCaseLetters : '');
  allowedChars += (isWithNumbers ? numbers : '');
  allowedChars += (isWithSpecial ? special : '');

  if (allowedChars.isEmpty) {
    return '';
  }

  int i = 0;

  String result = "";

  while (i < numberCharPassword) {
    int randomInt = Random.secure().nextInt(allowedChars.length);
    result += allowedChars[randomInt];
    i++;
  }

  return result;
}
