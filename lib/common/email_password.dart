import 'package:flutter/material.dart';

import 'validator.dart';

class EmailPassword extends ChangeNotifier {
  String _email;

  String get email => _email;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String _password;

  String get password => _password;

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  bool isEmailValid() => Validators.isValidEmail(email);

  bool isPasswordValid() => Validators.isValidPassword(password);

  bool isPopulated() => (email != null && email.isNotEmpty) &&
      (password != null  && password.isNotEmpty);

  bool isValid() => isEmailValid() && isPasswordValid() && isPopulated();
}
