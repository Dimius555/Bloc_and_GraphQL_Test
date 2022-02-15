part of 'character_details_cubit.dart';

@immutable
abstract class CharacterDetailsState {}

class CharacterDetailsInitial extends CharacterDetailsState {}

class UpdateCharacterDetails extends CharacterDetailsState {
  final Character character;

  UpdateCharacterDetails(this.character);
}

class ErrorEpisodesState extends CharacterDetailsState {}
