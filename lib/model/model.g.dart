// GENERATED CODE - DO NOT MODIFY BY HAND

part of sport_and_gamification_domain;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(id: json['id'] as String, image: json['image'] as String)
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..lastLogin = json['lastLogin'] == null
        ? null
        : DateTime.parse(json['lastLogin'] as String)
    ..history = json['history'] as String
    ..description = json['description'] as String
    ..friends = (json['friends'] as List)
        ?.map((e) =>
            e == null ? null : Player.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..xp = json['xp'] as num
    ..level = json['level'] == null
        ? null
        : Level.fromJson(json['level'] as Map<String, dynamic>)
    ..club = json['club'] == null
        ? null
        : Club.fromJson(json['club'] as Map<String, dynamic>)
    ..missions = (json['missions'] as List)
        ?.map((e) =>
            e == null ? null : Mission.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..tasks = (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'email': instance.email,
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'history': instance.history,
      'description': instance.description,
      'friends': instance.friends,
      'xp': instance.xp,
      'level': instance.level,
      'club': instance.club,
      'missions': instance.missions,
      'tasks': instance.tasks
    };

Mission _$MissionFromJson(Map<String, dynamic> json) {
  return Mission(
      json['id'] as String,
      json['image'] as String,
      json['title'] as String,
      json['story'] as String,
      json['objective'] as String,
      json['progress'] as num);
}

Map<String, dynamic> _$MissionToJson(Mission instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'story': instance.story,
      'objective': instance.objective,
      'progress': instance.progress
    };

Trainer _$TrainerFromJson(Map<String, dynamic> json) {
  return Trainer(
      json['id'] as String,
      json['image'] as String,
      json['name'] as String,
      json['email'] as String,
      json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      json['club'] == null
          ? null
          : Club.fromJson(json['club'] as Map<String, dynamic>),
      (json['trainingGroups'] as List)
          ?.map((e) =>
              e == null ? null : Adventure.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['questsPool'] as List)
          ?.map((e) =>
              e == null ? null : Quest.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['eventsPool'] as List)
          ?.map((e) =>
              e == null ? null : Event.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['exerciseExercise'] as List)
          ?.map((e) =>
              e == null ? null : Exercise.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TrainerToJson(Trainer instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'email': instance.email,
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'club': instance.club,
      'trainingGroups': instance.trainingGroups,
      'questsPool': instance.questsPool,
      'exerciseExercise': instance.exerciseExercise,
      'eventsPool': instance.eventsPool
    };

Club _$ClubFromJson(Map<String, dynamic> json) {
  return Club(
      json['id'] as String,
      json['image'] as String,
      json['name'] as String,
      json['description'] as String,
      json['story'] as String,
      json['history'] as String,
      (json['taskPool'] as List)
          ?.map((e) =>
              e == null ? null : Task.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['playerPool'] as List)
          ?.map((e) =>
              e == null ? null : Player.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['trainingGroups'] as List)
          ?.map((e) =>
              e == null ? null : Adventure.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['questsPool'] as List)
          ?.map((e) =>
              e == null ? null : Quest.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['eventsPool'] as List)
          ?.map((e) =>
              e == null ? null : Event.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['exerciseExercise'] as List)
          ?.map((e) =>
              e == null ? null : Exercise.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['skillPool'] as List)
          ?.map((e) =>
              e == null ? null : Skill.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['trainerPool'] as List)
          ?.map((e) =>
              e == null ? null : Trainer.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ClubToJson(Club instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'story': instance.story,
      'history': instance.history,
      'taskPool': instance.taskPool,
      'playerPool': instance.playerPool,
      'trainingGroups': instance.trainingGroups,
      'questsPool': instance.questsPool,
      'eventsPool': instance.eventsPool,
      'exerciseExercise': instance.exerciseExercise,
      'skillPool': instance.skillPool,
      'trainerPool': instance.trainerPool
    };

Adventure _$AdventureFromJson(Map<String, dynamic> json) {
  return Adventure(
      json['id'] as String,
      json['image'] as String,
      json['title'] as String,
      json['story'] as String,
      (json['trainings'] as List)
          ?.map((e) =>
              e == null ? null : Quest.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['trainer'] == null
          ? null
          : Trainer.fromJson(json['trainer'] as Map<String, dynamic>),
      (json['player'] as List)
          ?.map((e) =>
              e == null ? null : Player.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AdventureToJson(Adventure instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'story': instance.story,
      'trainings': instance.trainings,
      'trainer': instance.trainer,
      'player': instance.player
    };

Quest _$QuestFromJson(Map<String, dynamic> json) {
  return Quest(
      json['id'] as String,
      json['image'] as String,
      json['date'],
      json['duration'],
      json['title'] as String,
      json['story'] as String,
      (json['player'] as List)
          ?.map((e) =>
              e == null ? null : Player.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['events'] as List)
          ?.map((e) =>
              e == null ? null : Event.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['participations'] as List)
          ?.map((e) => e == null
              ? null
              : Participation.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['xp'] as num);
}

Map<String, dynamic> _$QuestToJson(Quest instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'date': instance.date,
      'duration': instance.duration,
      'title': instance.title,
      'story': instance.story,
      'player': instance.player,
      'events': instance.events,
      'participations': instance.participations,
      'xp': instance.xp
    };

Participation _$ParticipationFromJson(Map<String, dynamic> json) {
  return Participation(
      json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
      (json['players'] as List)
          ?.map((e) =>
              e == null ? null : Player.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ParticipationToJson(Participation instance) =>
    <String, dynamic>{'event': instance.event, 'players': instance.players};

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
      json['id'] as String,
      json['image'] as String,
      json['title'] as String,
      json['story'] as String,
      json['description'] as String,
      json['exercise'] == null
          ? null
          : Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
      json['xp'] as num);
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'story': instance.story,
      'description': instance.description,
      'exercise': instance.exercise,
      'xp': instance.xp
    };

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return Exercise(
      json['id'] as String,
      json['image'] as String,
      json['title'] as String,
      json['description'] as String,
      json['difficultyRating'] as num);
}

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'difficultyRating': instance.difficultyRating
    };

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
      json['id'] as String,
      json['image'] as String,
      json['start'],
      json['end'],
      json['title'] as String,
      json['story'] as String,
      json['description'] as String,
      (json['skillRequired'] as List)
          ?.map((e) =>
              e == null ? null : Skill.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['xp'] as num);
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'start': instance.start,
      'end': instance.end,
      'title': instance.title,
      'story': instance.story,
      'description': instance.description,
      'skillRequired': instance.skillRequired,
      'xp': instance.xp
    };

Level _$LevelFromJson(Map<String, dynamic> json) {
  return Level(
      json['levelNumber'] as num, json['minXp'] as num, json['maxXp'] as num);
}

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'levelNumber': instance.levelNumber,
      'minXp': instance.minXp,
      'maxXp': instance.maxXp
    };

Skill _$SkillFromJson(Map<String, dynamic> json) {
  return Skill(json['id'] as String, json['image'] as String,
      json['name'] as String, json['description'] as String);
}

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description
    };
