import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sport_and_gamification/services/authentication_gate.dart';
import 'package:user_repository/user_repository.dart';

class AuthenticationProvider extends ChangeNotifier {
  final UserRepository _userRepository;
  FirebaseUser _user;
  LoginState _loginState;
  RegisterState _registerState;
  AuthenticationGate _authGate;

  FirebaseUser get user => _user;

  LoginState get loginState => _loginState;

  RegisterState get registerState => _registerState;

  AuthenticationProvider(
      {@required UserRepository userRepository,
      @required AuthenticationGate authGate})
      : assert(userRepository != null),
        _userRepository = userRepository,
        _authGate = authGate;

  void isSignedIn() async {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        _user = await _userRepository.getUser();
        _authGate.state = AuthState.loggedIn;
      } else {
        _authGate.state = AuthState.unauthenticated;
      }
    } catch (_) {
      _authGate.state = AuthState.unauthenticated;
    }
    notifyListeners();
  }

  void signInWithGoogle() async {
    _loginState = LoginState.loading;
    notifyListeners();
    try {
      _user = await _userRepository.signInWithGoogle();
      _authGate.state = AuthState.loggedIn;
      _loginState = LoginState.success;
    } catch (_) {
      _authGate.state = AuthState.unauthenticated;
      _loginState = LoginState.failed;
    }
    notifyListeners();
  }

  void signUp(String email, String password) async {
    _registerState = RegisterState.loading;
    notifyListeners();
    try {
      _user = await _userRepository.signUp(
        email: email,
        password: password,
      );
      _authGate.state = AuthState.loggedIn;
      _registerState = RegisterState.success;
    } catch (_) {
      _authGate.state = AuthState.unauthenticated;
      _registerState = RegisterState.failed;
    }
    notifyListeners();
  }

  void loginWithCredentials({
    String email,
    String password,
  }) async {
    _loginState = LoginState.loading;
    notifyListeners();
    try {
      _user = await _userRepository.signInWithCredentials(email, password);
      _authGate.state = AuthState.loggedIn;
      _loginState = LoginState.success;
    } catch (_) {
      _authGate.state = AuthState.unauthenticated;
      _loginState = LoginState.failed;
    }
    notifyListeners();
  }

  void signOut() async {
    _authGate.state = AuthState.loggedOut;
    await _userRepository.signOut();
    _user = null;
    notifyListeners();
  }
}

enum LoginState { success, loading, failed, ignore }
enum RegisterState { success, loading, failed, ignore }
