import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'trainer.g.dart';

///Trainer
@JsonSerializable()
class Trainer implements User {
  @override
  String id;
  @override
  String image;
  @override
  String name;
  @override
  String email;
  @override
  var lastLogin;

  Club club;

  List<Adventure> trainingGroups;
  List<Quest> questsPool;

  ///Pool of quest for Trainers to choose from

  List<Exercise> exerciseExercise;

  ///Exercise pool
  List<Event> eventsPool;

  ///Pool of events to choose from

  Trainer(
      this.id,
      this.image,
      this.name,
      this.email,
      this.lastLogin,
      this.club,
      this.trainingGroups,
      this.questsPool,
      this.eventsPool,
      this.exerciseExercise);

  factory Trainer.fromJson(Map<String, dynamic> json) => _$TrainerFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerToJson(this);
}