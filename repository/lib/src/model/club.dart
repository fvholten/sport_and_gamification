import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'club.g.dart';

///Der Verein
@JsonSerializable()
class Club implements DomainObject {
  @override
  String id;
  @override
  String image;

  String name;
  String description;
  String story;
  String history;

  List<Task> taskPool;

  ///Besondere Aufgaben
  List<Player> playerPool;

  ///Mitglieder

  List<Adventure> trainingGroups;

  ///Training Groups available
  List<Quest> questsPool;

  ///Pool of quest for Trainers to choose from
  List<Event> eventsPool;

  ///Pool of events to choose from
  List<Exercise> exerciseExercise;

  ///Exercise pool
  List<Skill> skillPool;

  ///Skills werden benötigt um Tasks zu machen
  List<Trainer> trainerPool;

  Club(
      this.id,
      this.image,
      this.name,
      this.description,
      this.story,
      this.history,
      this.taskPool,
      this.playerPool,
      this.trainingGroups,
      this.questsPool,
      this.eventsPool,
      this.exerciseExercise,
      this.skillPool,
      this.trainerPool);

  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);

  Map<String, dynamic> toJson() => _$ClubToJson(this);
}