// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Participation _$ParticipationFromJson(Map<String, dynamic> json) {
  return Participation(
    json['event'] == null
        ? null
        : Event.fromJson(json['event'] as Map<String, dynamic>),
    (json['players'] as List)
        ?.map((e) =>
            e == null ? null : Player.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ParticipationToJson(Participation instance) =>
    <String, dynamic>{
      'event': instance.event,
      'players': instance.players,
    };
