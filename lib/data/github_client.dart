import 'dart:async';
import 'dart:convert';

import 'package:flutter_repo/index.dart';
import 'package:http/http.dart' as http;

class GithubClient {
  final String baseUrl;
  final http.Client httpClient;

  GithubClient({
    http.Client httpClient,
    this.baseUrl = Configuration.baseUrl,
  }) : this.httpClient = httpClient ?? http.Client();

  Future<List<CommitsResult>> fetchCommits(String owner, String repo,
      {int page, int perPage}) async {
    List<CommitsResult> commits = [];
    final response = await httpClient
        .get(Uri.parse("$baseUrl/repos/$owner/$repo/commits?page=$page"
            "&per_page=$perPage"))
        .timeout(Duration(seconds: Configuration.timeOut));

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      result.forEach((commit) {
        commits.add(CommitsResult.fromJson(commit));
      });
      return commits;
    } else {
      throw CommitsResultError.fromJson(commits);
    }
  }
}
