// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) {
  return Level(
    json['levelNumber'] as num,
    json['minXp'] as num,
    json['maxXp'] as num,
  );
}

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'levelNumber': instance.levelNumber,
      'minXp': instance.minXp,
      'maxXp': instance.maxXp,
    };
