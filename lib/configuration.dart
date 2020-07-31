import 'package:flutter/foundation.dart';

@immutable
class Configuration {
  static const String baseUrl = "https://api.github.com";
  static const int timeOut = 7;
  static const String defaultOwner = 'flutter';
  static const String defaultRepo = 'flutter';
}
