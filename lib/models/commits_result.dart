class CommitsResult {
  Commit commit;
  String url;
  String htmlUrl;
  String commentsUrl;
  Author author;
  Author committer;

  CommitsResult({
    this.commit,
    this.url,
    this.htmlUrl,
    this.commentsUrl,
    this.author,
    this.committer,
  });

  factory CommitsResult.fromJson(Map<String, dynamic> json) => CommitsResult(
        commit: Commit.fromJson(json["commit"]),
        url: json["url"],
        htmlUrl: json["html_url"],
        commentsUrl: json["comments_url"],
        author: Author.fromJson(json["author"]),
        committer: Author.fromJson(json["committer"]),
      );
}

class Author {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  Author({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  static List<CommitsResult> fromJsonList(List list) {
    if (list == null) return null;

    return list.map((commit) => CommitsResult.fromJson(commit)).toList();
  }
}

class Commit {
  CommitAuthor author;
  CommitAuthor committer;
  String message;
  String url;
  int commentCount;

  Commit({
    this.author,
    this.committer,
    this.message,
    this.url,
    this.commentCount,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: CommitAuthor.fromJson(json["author"]),
        committer: CommitAuthor.fromJson(json["committer"]),
        message: json["message"],
        url: json["url"],
        commentCount: json["comment_count"],
      );
}

class CommitAuthor {
  String name;
  String email;
  DateTime date;

  CommitAuthor({
    this.name,
    this.email,
    this.date,
  });

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
      );
}
