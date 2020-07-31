import 'dart:async';

import 'package:flutter_repo/index.dart';

abstract class Repository {
  Future<List<CommitsResult>> fetchCommits(String owner, String repo);
}

class GithubRepository implements Repository {
  final GithubClient client;

  GithubRepository(this.client);

  @override
  Future<List<CommitsResult>> fetchCommits(String owner, String repo) async {
    final result = await client.fetchCommits(owner, repo, page: 1, perPage: 20);
    return result;
  }
}
