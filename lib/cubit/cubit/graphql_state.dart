part of 'graphql_cubit.dart';

abstract class GraphqlState extends Equatable {
  const GraphqlState();

  @override
  List<Object> get props => [];
}

class GraphqlInitial extends GraphqlState {}
