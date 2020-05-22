// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mission _$MissionFromJson(Map<String, dynamic> json) {
  return Mission(
    json['id'] as String,
    json['image'] as String,
    json['title'] as String,
    json['story'] as String,
    json['objective'] as String,
    json['progress'] as num,
  );
}

Map<String, dynamic> _$MissionToJson(Mission instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'story': instance.story,
      'objective': instance.objective,
      'progress': instance.progress,
    };
