import 'package:graphql_flutter/graphql_flutter.dart';

abstract class NetworkProviderInterface {
  Future<QueryResult> getCharactersList(int page);
  Future<QueryResult> getCharacterDetails(String id);
}
