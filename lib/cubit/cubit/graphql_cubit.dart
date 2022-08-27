import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'graphql_state.dart';

class GraphqlCubit extends Cubit<GraphqlState> {
  GraphqlCubit() : super(GraphqlInitial());
}
