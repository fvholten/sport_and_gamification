// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adventure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Adventure _$AdventureFromJson(Map<String, dynamic> json) {
  return Adventure(
    json['id'] as String,
    json['image'] as String,
    json['title'] as String,
    json['story'] as String,
    (json['trainings'] as List)
        ?.map(
            (e) => e == null ? null : Quest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['trainer'] == null
        ? null
        : Trainer.fromJson(json['trainer'] as Map<String, dynamic>),
    (json['player'] as List)
        ?.map((e) =>
            e == null ? null : Player.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AdventureToJson(Adventure instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'story': instance.story,
      'trainings': instance.trainings,
      'trainer': instance.trainer,
      'player': instance.player,
    };
