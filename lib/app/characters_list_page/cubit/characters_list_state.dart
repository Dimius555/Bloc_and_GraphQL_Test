part of 'characters_list_cubit.dart';

@immutable
abstract class CharactersListState {}

class CharactersListInitial extends CharactersListState {}

class DisplayListOfCharactersState extends CharactersListState {
  final List<Character> list;

  DisplayListOfCharactersState(this.list);
}

class DisplayEmptyListState extends CharactersListState {}
