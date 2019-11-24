import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'exercise.g.dart';

///Die Übung
@JsonSerializable()
class Exercise implements DomainObject {
  @override
  String id;
  @override
  String image;

  String title;
  String description;

  num difficultyRating;

  Exercise(
      this.id, this.image, this.title, this.description, this.difficultyRating);

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}