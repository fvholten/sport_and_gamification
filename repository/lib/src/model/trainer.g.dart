// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
  );
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
      'eventsPool': instance.eventsPool,
    };
