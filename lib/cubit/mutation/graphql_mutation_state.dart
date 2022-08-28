part of 'graphql_mutation_cubit.dart';

abstract class GraphqlMutationState extends Equatable {
  const GraphqlMutationState();

  @override
  List<Object> get props => [];
}

class GraphqlMutationInitial extends GraphqlMutationState {}

class GraphqlMutationLoading extends GraphqlMutationState {}

class GraphqlMutationFailed extends GraphqlMutationState {
  final String error;
  GraphqlMutationFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
