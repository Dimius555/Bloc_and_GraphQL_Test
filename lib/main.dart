import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_test/app/characters_list_page/characters_list_page.dart';

void main() async {
  await initHiveForFlutter();

  final Link serverRootLink = HttpLink("https://rickandmortyapi.com/graphql");

  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
          cache: GraphQLCache(store: InMemoryStore()), link: serverRootLink));

  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client}) : super(key: key);

  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CharactersListPage(),
      ),
    );
  }
}
