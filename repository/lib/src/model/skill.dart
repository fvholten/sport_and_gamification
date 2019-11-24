import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'skill.g.dart';

@JsonSerializable()
class Skill implements DomainObject {
  @override
  String id;
  @override
  String image;

  String name;
  String description;

  Skill(this.id, this.image, this.name, this.description);

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}