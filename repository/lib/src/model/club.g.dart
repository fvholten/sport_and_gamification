// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Club _$ClubFromJson(Map<String, dynamic> json) {
  return Club(
    json['id'] as String,
    json['image'] as String,
    json['name'] as String,
    json['description'] as String,
    json['story'] as String,
    json['history'] as String,
    (json['taskPool'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
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
        ?.map(
            (e) => e == null ? null : Quest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['eventsPool'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['exerciseExercise'] as List)
        ?.map((e) =>
            e == null ? null : Exercise.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['skillPool'] as List)
        ?.map(
            (e) => e == null ? null : Skill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['trainerPool'] as List)
        ?.map((e) =>
            e == null ? null : Trainer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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
      'trainerPool': instance.trainerPool,
    };
