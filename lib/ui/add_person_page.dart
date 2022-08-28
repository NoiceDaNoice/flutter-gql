import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_app/query.dart';
import 'package:graphql_app/service/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../cubit/mutation/graphql_mutation_cubit.dart';
import '../cubit/query/graphql_query_cubit.dart';

class AddPersonPage extends StatelessWidget {
  AddPersonPage({Key? key}) : super(key: key);
  final TextEditingController namaController = TextEditingController(text: '');
  final TextEditingController namaBelakangController =
      TextEditingController(text: '');
  final TextEditingController umurController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    var rng = Random();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Person'),
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
              'Tambah Person',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async{
              context.read<GraphqlMutationCubit>().addPerson(
                    id: rng.nextInt(1000).toString(),
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
