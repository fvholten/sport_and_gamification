import 'package:flutter/material.dart';
import 'package:repository/repository.dart';

class ModelProvider extends ChangeNotifier {
  bool _loading = true;

  Player _player;

  bool get loading => _loading;

  Player get player => _player;

  void loadPlayer(FirebasePlayerRepository playerRepository, String id) async {
    this._player = await playerRepository.getPlayer(id);
    _loading = false;
    notifyListeners();
  }
}
