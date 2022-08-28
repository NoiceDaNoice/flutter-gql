import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_app/query.dart';
import 'package:graphql_app/service/graphql_service.dart';
import 'package:graphql_app/ui/edit_person_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../cubit/query/graphql_query_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    context.read<GraphqlQueryCubit>().fetchAllPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graphql App'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<GraphqlQueryCubit>().fetchAllPerson();
            },
            child: const Icon(Icons.refresh),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add-person-page');
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<GraphqlQueryCubit, GraphqlQueryState>(
        builder: (context, state) {
          if (state is GraphqlQuerySuccess) {
            return ListView.builder(
              itemCount: state.dataModel.persons!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPersonPage(
                          personModel: state.dataModel.persons![index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ' + state.dataModel.persons![index].name!,
                        ),
                        Text(
                          'Last Name: ' +
                              state.dataModel.persons![index].lastName!,
                        ),
                        Text(
                          'ID: ' + state.dataModel.persons![index].id!,
                        ),
                        Text(
                          'Age: ' +
                              state.dataModel.persons![index].age!.toString(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
