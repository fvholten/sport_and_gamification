import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'adventure.g.dart';

///Trainingsgruppen
@JsonSerializable()
class Adventure implements DomainObject {
  @override
  String id;
  @override
  String image;

  String title;

  ///Main-Line
  String story;

  ///Trainings-Sessions
  List<Quest> trainings;

  ///Der Trainer der Gruppe
  Trainer trainer;

  ///Die Schüler
  List<Player> player;

  Adventure(this.id, this.image, this.title, this.story, this.trainings,
      this.trainer, this.player);

  factory Adventure.fromJson(Map<String, dynamic> json) => _$AdventureFromJson(json);

  Map<String, dynamic> toJson() => _$AdventureToJson(this);
}