library sport_and_gamification_domain;

abstract class DomainObject {
  ///Eindeutige Id
  String id;

  ///Bild
  String image;
}

///Nutzer der App
abstract class User implements DomainObject {
  String name;
  String email;
  var lastLogin;
}

///Die Schüler-Spieler
class Player implements User {
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

  String history;
  String description;
  CharacterLook look;
  List<Player> friends;

  num xp;
  Level level;
  List<Resource> resources;

  Club club;
  List<Mission> missions; ///Trainingsziele
  List<Task> tasks; ///Tasks done
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

  List<Quest> questsPool;///Pool of quest for Trainers to choose from
  List<Event> eventsPool;///Pool of events to choose from
  List<Exercise> exerciseExercise;  ///Exercise pool
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

  List<Task> taskPool;///Besondere Aufgaben
  List<Player> playerPool;///Mitglieder

  List<Adventure> trainingGroups;///Training Groups available
  List<Quest> questsPool;///Pool of quest for Trainers to choose from
  List<Event> eventsPool;///Pool of events to choose from
  List<Exercise> exerciseExercise;  ///Exercise pool
  List<Skill> skillPool;  ///Skills werden benötigt um Tasks zu machen
  List<Trainer> trainerPool;///Trainer
///
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
}

class Participation {
  Event event;
  List<Player> players;
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
}

///Die Übung
class Exercise implements DomainObject{

  @override
  String id;
  @override
  String image;

  String title;
  String description;

  num difficultyRating;
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
}

class Level {

  Level(num levelNumber, num minXp, num maxXp) {
    this.levelNumber = levelNumber;
    this.minXp  = minXp;
    this.maxXp = maxXp;
  }

  num levelNumber;
  num minXp;
  num maxXp;
}

abstract class CharacterLook {}


class Skill implements DomainObject {
  @override
  String id;
  @override
  String image;

  String name;
  String description;
}

abstract class Resource {
  num value;
}
