import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => ShowHome();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is Home) {
      yield ShowHome();
    } else if (event is Profile) {
      yield ShowProfile();
    } else {
      yield ShowHome();
    }
  }
}
