import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_app/ui/main_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/*
Gary Adam
https://www.linkedin.com/in/garyadam1234/ 
 */
void main() {
  final HttpLink httpLink =
      HttpLink('https://examplegraphql.herokuapp.com/graphql');
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  var app = GraphQLProvider(
    client: client,
    child: const MyApp(),
  );

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MainPage(),
      },
    );
  }
}
