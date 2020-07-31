import 'package:equatable/equatable.dart';
import 'package:flutter_repo/index.dart';

abstract class CommitsState extends Equatable {
  const CommitsState();

  @override
  List<Object> get props => [];
}

class CommitsStateEmpty extends CommitsState {}

class CommitsStateLoading extends CommitsState {}

class CommitsStateSuccess extends CommitsState {
  final List<CommitsResult> items;

  const CommitsStateSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'CommitsStateSuccess { items: ${items.length} }';
}

class CommitsStateError extends CommitsState {
  final String error;

  const CommitsStateError(this.error);

  @override
  List<Object> get props => [error];
}
