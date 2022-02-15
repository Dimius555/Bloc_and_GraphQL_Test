import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_test/domain/data_manager.dart';
import 'package:rick_and_morty_test/entities/character.dart';

part 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit() : super(CharacterDetailsInitial());

  void initEpisodes(String id) async {
    try {
      Character? character = await DataManager().getCharacterDetails(id);

      emit(UpdateCharacterDetails(character!));
    } catch (e) {
      emit(ErrorEpisodesState());
    }
  }
}
