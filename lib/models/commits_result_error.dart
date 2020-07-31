class CommitsResultError {
  final String message;

  const CommitsResultError({this.message});

  static CommitsResultError fromJson(dynamic json) {
    return CommitsResultError(
      message: json['message'] as String,
    );
  }
}
