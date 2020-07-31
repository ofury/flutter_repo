import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CommitsEvent extends Equatable {
  const CommitsEvent();
}

class RepoChanged extends CommitsEvent {
  final String owner;
  final String repo;

  const RepoChanged({@required this.owner, @required this.repo});

  @override
  List<Object> get props => [owner, repo];

  @override
  String toString() => 'RepoChanged { owner: $owner, repo: $repo }';
}
