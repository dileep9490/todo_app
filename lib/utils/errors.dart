class CredentialsIncorrect implements Exception {}

class InternalServerError implements Exception {
  String error;
  InternalServerError({
    required this.error,
  });
}
