import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'event.g.dart';

///Aufgabe im Training
@JsonSerializable()
class Event implements DomainObject {
  @override
  String id;
  @override
  String image;

  String title;
  String story;

  String description;
  Exercise exercise;

  num xp;
  //List<Resource> reward;

  Event(this.id, this.image, this.title, this.story, this.description,
      this.exercise, this.xp);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

}