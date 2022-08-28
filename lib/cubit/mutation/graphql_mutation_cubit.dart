import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../service/graphql_service.dart';

part 'graphql_mutation_state.dart';

class GraphqlMutationCubit extends Cubit<GraphqlMutationState> {
  GraphqlMutationCubit() : super(GraphqlMutationInitial());

  void addPerson({
    required String id,
    required String name,
    required String lastName,
    required int age,
  }) async {
    try {
      await GraphqlService().addPerson(
        id,
        name,
        lastName,
        age,
      );
    } catch (e) {
      emit(GraphqlMutationFailed(e.toString()));
    }
  }

  void editPerson({
    required String id,
    required String name,
    required String lastName,
    required int age,
  }) async {
    try {
      await GraphqlService().editPerson(
        id,
        name,
        lastName,
        age,
      );
    } catch (e) {
      emit(GraphqlMutationFailed(e.toString()));
    }
  }

  void detelePerson({
    required String id,
  }) async {
    try {
      await GraphqlService().detelePerson(
        id,
      );
    } catch (e) {
      emit(GraphqlMutationFailed(e.toString()));
    }
  }
}
