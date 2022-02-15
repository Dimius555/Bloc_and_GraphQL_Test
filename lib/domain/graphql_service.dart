import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static final Link serverRootLink =
      HttpLink("https://rickandmortyapi.com/graphql");

  final GraphQLClient _client = GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()), link: serverRootLink);

  Future<QueryResult> performQuery(String query,
      {required Map<String, dynamic> variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables);

    final result = await _client.query(options);

    return result;
  }

  Future<QueryResult> performMutation(String query,
      {required Map<String, dynamic> variables}) async {
    MutationOptions options =
        MutationOptions(document: gql(query), variables: variables);

    final result = await _client.mutate(options);

    print(result.exception?.graphqlErrors.toString());

    return result;
  }
}
