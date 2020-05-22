// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
        ?.map(
            (e) => e == null ? null : Skill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['xp'] as num,
  );
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
      'xp': instance.xp,
    };
