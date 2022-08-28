import 'dart:convert';
import 'dart:ffi';

import 'package:graphql_app/model/data_model.dart';
import 'package:graphql_app/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlService {
  GraphQLClient client = GraphQLClient(
    link: HttpLink('https://examplegraphql.herokuapp.com/graphql'),
    cache: GraphQLCache(),
  );

  Future<DataModel> getAllPerson() async {
    try {
      QueryResult queryResult = await client.query(
        QueryOptions(
          cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
          document: gql(
            getAllUsersQuery,
          ),
        ),
      );
      DataModel data = DataModel.fromJson(queryResult.data!);
      return data;
    } catch (e) {
      throw e;
    }
  }

  Future<void> addPerson(
      String id, String name, String lastName, int age) async {
    try {
      await client.mutate(
        MutationOptions(
          cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
          document: gql(
            addPersonQuery(id, name, lastName, age),
          ),
        ),
      );
    } catch (e) {
      throw e;
    }
  }

  Future<void> editPerson(
      String id, String name, String lastName, int age) async {
    try {
      QueryResult queryResult = await client.mutate(
        MutationOptions(
          cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
          document: gql(
            editPersonQuery(id, name, lastName, age),
          ),
        ),
      );
      if (queryResult.hasException) {
        print(queryResult.exception);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> detelePerson(String id) async {
    try {
      await client.mutate(
        MutationOptions(
          cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
          document: gql(
            deletePersonQuery(id),
          ),
        ),
      );
    } catch (e) {
      throw e;
    }
  }
}
