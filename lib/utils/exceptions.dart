import 'package:food365/utils/constants.dart';

class SomethingWentWrong implements Exception {
  final String cause = somethingWentWrong;
}

class DatabaseNotFound implements Exception {
  final String cause = databaseNotFound;
}

class ServiceUnavailable implements Exception {
  final String cause = serviceUnavialable;
}
