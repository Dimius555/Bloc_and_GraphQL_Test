import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_test/domain/api.dart';
import 'package:rick_and_morty_test/domain/graphql_service.dart';
import 'package:rick_and_morty_test/interfaces/network_provider_interface.dart';

class NetworkProvider implements NetworkProviderInterface {
  static final NetworkProvider _singleton = NetworkProvider._internal();

  factory NetworkProvider() {
    return _singleton;
  }

  NetworkProvider._internal();

  final GraphQLService _service = GraphQLService();

  @override
  Future<QueryResult> getCharacterDetails(String id) async {
    return await _service
        .performMutation(characterDetailsQuery, variables: {"id": id});
  }

  @override
  Future<QueryResult> getCharactersList(int page) async {
    return await _service
        .performMutation(characterListQuery, variables: {"page": page});
  }
}
