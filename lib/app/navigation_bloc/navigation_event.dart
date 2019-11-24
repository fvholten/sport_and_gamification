import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Home extends NavigationEvent {}
class Profile extends NavigationEvent {}
