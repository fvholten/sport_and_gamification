import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'quest.g.dart';

///Ein Training
@JsonSerializable()
class Quest implements DomainObject {
  @override
  String id;
  @override
  String image;

  var date;
  var duration;

  String title;

  ///Plot des Trainings
  String story;

  ///Wer ist gekommen
  List<Player> player;

  ///Was wird gemacht
  List<Event> events;

  ///Wer tat was
  List<Participation> participations;

  ///Für die Teilnahme
  //List<Resource> reward;

  ///Für die Teilnahme am Training
  num xp;

  Quest(this.id, this.image, this.date, this.duration, this.title, this.story,
      this.player, this.events, this.participations, this.xp);

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

  Map<String, dynamic> toJson() => _$QuestToJson(this);
}