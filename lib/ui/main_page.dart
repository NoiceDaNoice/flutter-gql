import 'package:flutter/material.dart';
import 'package:graphql_app/query.dart';
import 'package:graphql_app/service/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget querytest() {
    return Query(
      options: QueryOptions(
        document: gql(getAllUsersQuery),
      ),
      builder: (QueryResult? result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result?.data == null) {
          return Text('nulll bro');
        }
        print(result!.data);
        return Text("test");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // querytest(),
          TextButton(
            onPressed: () {
              GraphqlService().getAllUsers();
            },
            child: Text("TEXT BUTTON"),
          )
        ],
      ),
    );
  }
}
