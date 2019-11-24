import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'task.g.dart';

///Aufgabe neben dem Training (extra Aufgaben wie: Laufen gehen oder Turniere etc.) Werden im Club geplegt.
@JsonSerializable()
class Task implements DomainObject {
  @override
  String id;
  @override
  String image;

  var start;
  var end;

  String title;
  String story;

  String description;

  List<Skill> skillRequired;
  num xp;
  //List<Resource> reward;

  Task(this.id, this.image, this.start, this.end, this.title, this.story,
      this.description, this.skillRequired, this.xp);

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}