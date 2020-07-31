import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_repo/index.dart';
import 'package:meta/meta.dart';

class CommitsBloc extends Bloc<CommitsEvent, CommitsState> {
  final GithubRepository githubRepository;

  CommitsBloc({@required this.githubRepository}) : super(CommitsStateEmpty());

  @override
  Stream<CommitsState> mapEventToState(CommitsEvent event) async* {
    if (event is RepoChanged) {
      final String repo = event.repo;
      final String owner = event.repo;
      if (repo.isEmpty || owner.isEmpty) {
        yield CommitsStateEmpty();
      } else {
        yield CommitsStateLoading();
        try {
          final results = await githubRepository.fetchCommits(owner, repo);
          yield CommitsStateSuccess(results);
        } catch (error) {
          yield error is CommitsResultError
              ? CommitsStateError(error.message)
              : CommitsStateError('Something went wrong');
        }
      }
    }
  }
}
