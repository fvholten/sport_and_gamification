import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'participation.g.dart';

@JsonSerializable()
class Participation {
  Event event;
  List<Player> players;

  Participation(this.event, this.players);

  factory Participation.fromJson(Map<String, dynamic> json) => _$ParticipationFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipationToJson(this);

}