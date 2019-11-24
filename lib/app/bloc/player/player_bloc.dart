import 'dart:async';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  @override
  PlayerState get initialState => InitialPlayerState();

  @override
  Stream<PlayerState> mapEventToState(
    PlayerEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
