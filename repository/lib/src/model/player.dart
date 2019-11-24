import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'player.g.dart';

///Die Schüler-Spieler
@JsonSerializable()
class Player implements User {
  Player({this.id, this.image});

  @override
  String id;
  @override
  String image;
  @override
  String name;
  @override
  String email;
  @override
  DateTime lastLogin;

  String history;
  String description;
  //CharacterLook look;
  List<Player> friends;

  num xp;
  Level level;
  //List<Resource> resources;

  Club club;
  List<Mission> missions;

  ///Trainingsziele
  List<Task> tasks;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}