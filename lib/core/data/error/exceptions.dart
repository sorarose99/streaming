import 'package:movies_app/core/data/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException(
      {required this.errorMessageModel, required String message});
}

class DatabaseException implements Exception {}
