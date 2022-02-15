import 'package:rick_and_morty_test/domain/network_provider.dart';
import 'package:rick_and_morty_test/entities/character.dart';
import 'package:rick_and_morty_test/interfaces/data_manager_interface.dart';

class DataManager implements DataManagerInterface {
  static final DataManager _singleton = DataManager._internal();

  factory DataManager() {
    return _singleton;
  }

  DataManager._internal();

  @override
  Future<Character?> getCharacterDetails(String id) async {
    final result = await NetworkProvider().getCharacterDetails(id);

    if (result.hasException && result.data != null) {
      print('graphQLErrors: ${result.exception?.graphqlErrors.toString()}');
      return null;
    } else {
      final Character character = Character.fromJson(result.data!['character']);
      return character;
    }
  }

  @override
  Future<List<Character>?> getCharactersList(int page) async {
    final result = await NetworkProvider().getCharactersList(page);

    if (result.hasException && result.data != null) {
      print('graphQLErrors: ${result.exception?.graphqlErrors.toString()}');
      return null;
    } else {
      if (result.data!['characters']['results'] is List) {
        List<Character> characters = [];

        final rawList = result.data!['characters']['results'] as List;

        for (var element in rawList) {
          characters.add(Character.fromJson(element));
        }

        return characters;
      } else {
        return null;
      }
    }
  }
}
