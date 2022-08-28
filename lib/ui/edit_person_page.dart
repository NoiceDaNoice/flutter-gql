import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_app/cubit/mutation/graphql_mutation_cubit.dart';
import 'package:graphql_app/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../cubit/query/graphql_query_cubit.dart';
import '../model/data_model.dart';

class EditPersonPage extends StatelessWidget {
  Person personModel;
  EditPersonPage({Key? key, required this.personModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController namaController =
        TextEditingController(text: personModel.name);
    final TextEditingController namaBelakangController =
        TextEditingController(text: personModel.lastName);
    final TextEditingController umurController =
        TextEditingController(text: personModel.age.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit/Delete Person'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<GraphqlMutationCubit>().detelePerson(
                    id: personModel.id!,
                  );
              context.read<GraphqlQueryCubit>().fetchAllPerson();
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: TextFormField(
              controller: namaController,
              decoration: const InputDecoration(
                label: Text(
                  'Nama',
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: TextFormField(
              controller: namaBelakangController,
              decoration: const InputDecoration(
                label: Text(
                  'Nama Belakang',
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: TextFormField(
              controller: umurController,
              decoration: const InputDecoration(
                label: Text(
                  'Umur',
                ),
              ),
            ),
          ),
          TextButton(
            child: Text(
              'Update Person',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              context.read<GraphqlMutationCubit>().editPerson(
                    id: personModel.id!,
                    name: namaController.text,
                    lastName: namaBelakangController.text,
                    age: int.parse(umurController.text),
                  );
              context.read<GraphqlQueryCubit>().fetchAllPerson();
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
          )
        ],
      ),
    );
  }
}
