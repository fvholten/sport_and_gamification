// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['participations'] as List)
        ?.map((e) => e == null
            ? null
            : Participation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['xp'] as num,
  );
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
      'xp': instance.xp,
    };
