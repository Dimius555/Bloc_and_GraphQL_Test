import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';
import 'package:rick_and_morty_test/app/character_details_page/character_details_page.dart';
import 'package:rick_and_morty_test/app/characters_list_page/cubit/characters_list_cubit.dart';
import 'package:rick_and_morty_test/widgets/character_list_widget.dart';

class CharactersListPage extends StatelessWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersListCubit()..initPageState(),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 230, 235, 235),
            title: Text(
              "Rick and Morty",
              style: TextStyle(
                  fontFamily: "Schwifty",
                  fontSize: 48,
                  color: Colors.green.shade400),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 230, 235, 235),
          body: BlocBuilder<CharactersListCubit, CharactersListState>(
            builder: (context, state) {
              if (state is DisplayListOfCharactersState) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoadMore(
                    onLoadMore: () => context
                        .read<CharactersListCubit>()
                        .loadMoreCharacters(),
                    child: ListView.builder(
                      itemBuilder: ((context, index) => CharacterListWidget(
                          onPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CharacterDetailsPage(
                                      character: state.list[index]))),
                          imageUrl: state.list[index].image,
                          name: state.list[index].name,
                          gender: state.list[index].gender)),
                      itemCount: state.list.length,
                    ),
                  ),
                );
              } else if (state is DisplayEmptyListState) {
                return const Center(
                  child: Text('Sorry, but all characters are ended',
                      style: TextStyle(
                          fontFamily: "Schwifty",
                          fontSize: 28,
                          color: Color.fromARGB(255, 151, 175, 153))),
                );
              } else {
                return Center(
                  child:
                      CircularProgressIndicator(color: Colors.green.shade400),
                );
              }
            },
          )),
    );
  }
}
