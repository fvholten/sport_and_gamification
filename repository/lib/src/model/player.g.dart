// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
    id: json['id'] as String,
    image: json['image'] as String,
  )
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
      'tasks': instance.tasks,
    };
