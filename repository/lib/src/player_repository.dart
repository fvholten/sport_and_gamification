import 'package:repository/src/model/model.dart';

abstract class PlayerRepository {


  Future<Player> getPlayer(String id);

  Stream<List<Player>> players();

  Future<void> updatePlayer(Player player);

}