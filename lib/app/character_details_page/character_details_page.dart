import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/app/character_details_page/cubit/character_details_cubit.dart';
import 'package:rick_and_morty_test/entities/character.dart';
import 'package:rick_and_morty_test/entities/episode.dart';
import 'package:rick_and_morty_test/widgets/episode_list_widget.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({Key? key, required this.character})
      : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            CharacterDetailsCubit()..initEpisodes(character.id),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 230, 235, 235),
          appBar: AppBar(
            elevation: 0,
            title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(character.name,
                  style: TextStyle(
                      fontFamily: "Schwifty",
                      fontSize: 34,
                      color: Colors.green.shade400)),
            ),
            leading: BackButton(
              onPressed: (() => Navigator.pop(context)),
              color: Colors.green.shade400,
            ),
            backgroundColor: const Color.fromARGB(255, 230, 235, 235),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Image.network(
                      character.image,
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(width: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          defineGenderIcon(),
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            character.name,
                            style: const TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Status: ${character.status}',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: const [
                    Text(
                      'Episodes:',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                flex: 2,
                child:
                    BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
                  builder: (context, state) {
                    if (state is UpdateCharacterDetails) {
                      return ListView.builder(
                        itemBuilder: ((context, index) => EpisodeListWidget(
                              episode: state.character.episodes![index],
                            )),
                        itemCount: state.character.episodes!.length,
                      );
                    } else if (state is ErrorEpisodesState) {
                      return const Center(child: Text('Something bad happend'));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.green.shade400,
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  String defineGenderIcon() {
    switch (character.gender) {
      case "Female":
        return 'assets/icons/ic_female.svg';
      case "Male":
        return 'assets/icons/ic_male.svg';
      case "Genderless":
        return 'assets/icons/ic_genderless.svg';
      case "unknown":
        return 'assets/icons/ic_unknown.svg';
      default:
        return 'assets/icons/ic_unknown.svg';
    }
  }
}
