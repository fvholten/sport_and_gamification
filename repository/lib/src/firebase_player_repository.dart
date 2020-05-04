import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'player_repository.dart';
import 'model/model.dart';

class FirebasePlayerRepository implements PlayerRepository {
  final playerCollection = Firestore.instance.collection('players');

  @override
  Future<Player> getPlayer(String id) {
    print('getPlayer was called:' + id);
    return playerCollection.document(id).get().then((snapshot) {
      if (snapshot.exists) {
        return Player.fromJson(snapshot.data);
      }
      return null;
    });
  }

  @override
  Stream<List<Player>> players() {
    return playerCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Player.fromJson(doc.data))
          .toList();
    });
  }

  @override
  Future<void> updatePlayer(Player player) {
    return playerCollection.document(player.id).updateData(player.toJson());
  }
}
