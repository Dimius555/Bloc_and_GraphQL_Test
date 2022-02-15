import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_test/entities/episode.dart';

part 'character.g.dart';

@JsonSerializable(explicitToJson: true)
class Character {
  Character(
      {required this.id,
      required this.name,
      required this.image,
      required this.gender,
      required this.episodes,
      required this.status});

  final String id;
  final String name;
  final String gender;
  final String image;
  final String status;
  @JsonKey(name: 'episode')
  final List<Episode>? episodes;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
