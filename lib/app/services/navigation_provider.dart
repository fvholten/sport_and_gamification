import 'package:flutter/cupertino.dart';
import 'package:repository/repository.dart';

class NavigationProvider extends ChangeNotifier {
  int _index = 0;
  NavigationState _state = NavigationState.Home;

  NavigationState get state => _state;

  int get index => _index;

  set state(NavigationState value) {
    _state = value;
    switch (value) {
      case NavigationState.Home:
        _index = 0;
        break;
      case NavigationState.Profile:
        _index = 1;
        break;
    }
    notifyListeners();
  }
}

enum NavigationState { Home, Profile }
