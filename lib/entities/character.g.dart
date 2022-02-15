// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      gender: json['gender'] as String,
      episodes: (json['episode'] as List<dynamic>?)
          ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'image': instance.image,
      'status': instance.status,
      'episode': instance.episodes?.map((e) => e.toJson()).toList(),
    };
