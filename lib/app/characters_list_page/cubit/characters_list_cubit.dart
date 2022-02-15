import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/domain/data_manager.dart';
import 'package:rick_and_morty_test/entities/character.dart';

part 'characters_list_state.dart';

class CharactersListCubit extends Cubit<CharactersListState> {
  CharactersListCubit() : super(CharactersListInitial());

  int page = 1;
  List<Character> characters = [];
  bool isLastPage = false;

  void initPageState() async {
    _loadCharacters();
  }

  Future<bool> loadMoreCharacters() async {
    page++;
    await _loadCharacters();
    return true;
  }

  Future<void> _loadCharacters() async {
    if (page == 1) {
      characters = await DataManager().getCharactersList(page) ?? [];
      emit(DisplayListOfCharactersState(characters));
    } else {
      List<Character> newCharacters =
          await DataManager().getCharactersList(page) ?? [];
      if (newCharacters.isEmpty) {
        isLastPage = true;
      }
      characters.addAll(newCharacters);
      emit(DisplayListOfCharactersState(characters));
    }
  }
}
