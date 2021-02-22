import 'package:localized_string/localized_string.dart';

abstract class LocalizeMessageException implements Exception {
  LocalizedString get localizedMessage;
}

class SchemeConsistencyException implements Exception {
  final String message;

  SchemeConsistencyException([this.message = 'Schemes consistency error']);

  @override
  String toString() {
    if (message == null) {
      return '$SchemeConsistencyException';
    }
    return '$SchemeConsistencyException: $message';
  }
}

abstract class DiagnosticMessageException implements Exception {
  String get diagnosticMessage;
}

abstract class LogicException extends LocalizeMessageException {}

class CancelledException implements LogicException {
  @override
  LocalizedString get localizedMessage => LocalizedString.fromString('Cancelled');
}

void require(bool invariant, Exception Function() exceptionFactory) {
  if (!invariant) {
    throw exceptionFactory();
  }
}
