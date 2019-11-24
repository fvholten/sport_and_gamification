import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  final int index = -1;
}

class ShowHome extends NavigationState {
  final int index = 0;
  final String name = 'Home';

  @override
  List<Object> get props => [index, name];
}

class ShowProfile extends NavigationState {

  final int index = 1;
  final String name = 'Profile';

  @override
  List<Object> get props => [index, name];
}
