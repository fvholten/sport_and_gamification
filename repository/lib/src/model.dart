library sport_and_gamification_domain;

import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

abstract class DomainObject {
  const DomainObject({this.id, this.image});

  ///Eindeutige Id
  final String id;

  ///Bild
  final String image;
}

///Nutzer der App
abstract class User implements DomainObject {
  const User({this.name, this.email, this.lastLogin});

  final String name;
  final String email;
  final DateTime lastLogin;
}

///Die Schüler-Spieler
@JsonSerializable()
class Player implements User {
  Player({this.id, this.image});

  @override
  String id;
  @override
  String image;
  @override
  String name;
  @override
  String email;
  @override
  DateTime lastLogin;

  String history;
  String description;
  //CharacterLook look;
  List<Player> friends;

  num xp;
  Level level;
  //List<Resource> resources;

  Club club;
  List<Mission> missions;

  ///Trainingsziele
  List<Task> tasks;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}

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

@JsonSerializable()
class Participation {
  Event event;
  List<Player> players;

  Participation(this.event, this.players);

  factory Participation.fromJson(Map<String, dynamic> json) => _$ParticipationFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipationToJson(this);

}

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

@JsonSerializable()
class Level {
  num levelNumber;
  num minXp;
  num maxXp;

  Level(this.levelNumber, this.minXp, this.maxXp);

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelToJson(this);
}

abstract class CharacterLook {}

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

abstract class Resource {
  num value;
}
