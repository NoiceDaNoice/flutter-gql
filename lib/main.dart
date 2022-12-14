import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_app/cubit/mutation/graphql_mutation_cubit.dart';
import 'package:graphql_app/ui/add_person_page.dart';
import 'package:graphql_app/ui/edit_person_page.dart';
import 'package:graphql_app/ui/main_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'cubit/query/graphql_query_cubit.dart';

/*
Gary Adam
https://www.linkedin.com/in/garyadam1234/ 
flutter version 3.0.2
emulator android API 30
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GraphqlQueryCubit(),
        ),BlocProvider(
          create: (context) => GraphqlMutationCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => MainPage(),
          '/add-person-page': (context) => AddPersonPage(),
        },
      ),
    );
  }
}
