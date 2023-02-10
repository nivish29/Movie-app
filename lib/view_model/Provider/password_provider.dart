import 'package:flutter/foundation.dart';

class PasswordProvider with ChangeNotifier {
  String _Password = '';
  bool _obscurePassword = true;
  String get Password => _Password;

  setPassword(String obscurePassword) {
    _Password = obscurePassword;
    notifyListeners();
  }

  setObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }
}
