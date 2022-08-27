import 'dart:convert';

import 'package:graphql_app/model/person_model.dart';
import 'package:graphql_app/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlService {
  GraphQLClient client = GraphQLClient(
    link: HttpLink('https://examplegraphql.herokuapp.com/graphql'),
    cache: GraphQLCache(),
  );

  Future<List<PersonModel>> getAllUsers() async {
    QueryResult queryResult = await client.query(
      QueryOptions(
        cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
        document: gql(
          getAllUsersQuery,
        ),
      ),
    );

    Map<String,dynamic> StringResponse = queryResult.data!['persons'];
    print(StringResponse.length);
    print("testtttttt     ");
    print(queryResult.data!['persons']);
    List<PersonModel>? persons;
    persons?.add(
        PersonModel( typename: 'test',name: 'test', lastName: 'test', age: 5));
    return persons!;
  }
}
