import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable(explicitToJson: true)
class Episode {
  Episode({
    required this.id,
    required this.name,
    required this.episode,
  });

  final String id;
  final String name;
  final String episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
