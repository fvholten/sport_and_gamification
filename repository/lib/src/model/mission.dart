import 'model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission.g.dart';

///Tainingsziel für Spieler
@JsonSerializable()
class Mission implements DomainObject {
  @override
  String id;
  @override
  String image;

  String title;
  String story;

  ///Beschreibung des Ziels
  String objective;

  ///100% -> done | 0% -> not done
  num progress = 0;

  Mission(this.id, this.image, this.title, this.story, this.objective,
      this.progress);

  factory Mission.fromJson(Map<String, dynamic> json) => _$MissionFromJson(json);

  Map<String, dynamic> toJson() => _$MissionToJson(this);
}