import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/entities/episode.dart';

class EpisodeListWidget extends StatelessWidget {
  const EpisodeListWidget({Key? key, required this.episode}) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Episode name: ${episode.name}",
            style: const TextStyle(fontSize: 20),
          ),
          Text("Episode: ${episode.episode}",
              style: const TextStyle(fontSize: 14)),
          const Divider()
        ],
      ),
    );
  }
}
