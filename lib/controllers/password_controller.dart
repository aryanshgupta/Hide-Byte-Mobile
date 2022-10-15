import 'package:flutter/material.dart';

class PasswordController extends ChangeNotifier {
  final TextEditingController generatedPassword = TextEditingController();

  void setPassword(String value) {
    generatedPassword.text = value;
    notifyListeners();
  }

  double passwordLength = 8.0;

  void setLength(double value) {
    passwordLength = value;
    notifyListeners();
  }

  bool withUpperCase = false;

  void setWithUpperCase(bool value) {
    withUpperCase = value;
    notifyListeners();
  }

  bool withLowerCase = false;

  void setWithLowerCase(bool value) {
    withLowerCase = value;
    notifyListeners();
  }

  bool withNumbers = false;

  void setWithNumbers(bool value) {
    withNumbers = value;
    notifyListeners();
  }

  bool withSpecial = false;

  void setWithSpecial(bool value) {
    withSpecial = value;
    notifyListeners();
  }
}
