part of 'graphql_query_cubit.dart';

abstract class GraphqlQueryState extends Equatable {
  const GraphqlQueryState();

  @override
  List<Object> get props => [];
}

class GraphqlQueryInitial extends GraphqlQueryState {}

class GraphqlQueryLoading extends GraphqlQueryState {}

class GraphqlQueryFailed extends GraphqlQueryState {
  final String error;
  GraphqlQueryFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class GraphqlQuerySuccess extends GraphqlQueryState {
  final DataModel dataModel;
  GraphqlQuerySuccess(this.dataModel);

  @override
  // TODO: implement props
  List<Object> get props => [dataModel];
}
