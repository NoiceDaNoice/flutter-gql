import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_app/model/data_model.dart';
import 'package:graphql_app/service/graphql_service.dart';

part 'graphql_query_state.dart';

class GraphqlQueryCubit extends Cubit<GraphqlQueryState> {
  GraphqlQueryCubit() : super(GraphqlQueryInitial());

  void fetchAllPerson() async {
    try {
      emit(GraphqlQueryLoading());
      DataModel dataModel = await GraphqlService().getAllPerson();
      emit(GraphqlQuerySuccess(dataModel));
    } catch (e) {
      emit(GraphqlQueryFailed(e.toString()));
    }
  }
}
