import 'package:rick_and_morty_test/entities/character.dart';

abstract class DataManagerInterface {
  Future<List<Character>?> getCharactersList(int page);
  Future<Character?> getCharacterDetails(String id);
}
