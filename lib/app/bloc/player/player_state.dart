import 'package:equatable/equatable.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();
}

class InitialPlayerState extends PlayerState {
  @override
  List<Object> get props => [];
}
