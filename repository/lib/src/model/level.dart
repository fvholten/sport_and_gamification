import 'package:json_annotation/json_annotation.dart';

part 'level.g.dart';

@JsonSerializable()
class Level {
  num levelNumber;
  num minXp;
  num maxXp;

  Level(this.levelNumber, this.minXp, this.maxXp);

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelToJson(this);
}