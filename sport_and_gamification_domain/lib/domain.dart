library sport_and_gamification_domain;

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
  CharacterLook look;
  List<Player> friends;

  num xp;
  Level level;
  List<Resource> resources;

  Club club;
  List<Mission> missions;

  ///Trainingsziele
  List<Task> tasks;

  ///Tasks done

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'history': history,
      'description': description,
      'look': look,
      'friends': friends,
      'xp': xp,
      'level': level,
      'resources': resources,
      'club': club,
      'missions': missions,
      'tasks': tasks,
    };
  }
}

///Tainingsziel für Spieler
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
}

///Trainer
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
}

///Der Verein
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

  ///Trainer

}

///Trainingsgruppen
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
}

///Ein Training
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
  List<Resource> reward;

  ///Für die Teilnahme am Training
  num xp;

  Quest(this.id, this.image, this.date, this.duration, this.title, this.story,
      this.player, this.events, this.participations, this.reward, this.xp);
}

class Participation {
  Event event;
  List<Player> players;

  Participation(this.event, this.players);
}

///Aufgabe im Training
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
  List<Resource> reward;

  Event(this.id, this.image, this.title, this.story, this.description,
      this.exercise, this.xp, this.reward);
}

///Die Übung
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
}

///Aufgabe neben dem Training (extra Aufgaben wie: Laufen gehen oder Turniere etc.) Werden im Club geplegt.
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
  List<Resource> reward;

  Task(this.id, this.image, this.start, this.end, this.title, this.story,
      this.description, this.skillRequired, this.xp, this.reward);
}

class Level {
  num levelNumber;
  num minXp;
  num maxXp;

  Level(this.levelNumber, this.minXp, this.maxXp);
}

abstract class CharacterLook {}

class Skill implements DomainObject {
  @override
  String id;
  @override
  String image;

  String name;
  String description;

  Skill(this.id, this.image, this.name, this.description);
}

abstract class Resource {
  num value;
}
