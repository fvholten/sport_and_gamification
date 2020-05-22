// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
    json['xp'] as num,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'story': instance.story,
      'description': instance.description,
      'exercise': instance.exercise,
      'xp': instance.xp,
    };
