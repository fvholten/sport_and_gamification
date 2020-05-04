import 'package:flutter/material.dart';

class AuthenticationGate extends ChangeNotifier {

  AuthState _state = AuthState.uninitialized;

  AuthState get state => _state;

  set state(AuthState value) {
    _state = value;
    notifyListeners();
  }
}

enum AuthState { uninitialized, loggedIn, unauthenticated, loggedOut }
