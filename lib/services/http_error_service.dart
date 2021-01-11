enum HttpError {
  badRequest,
  notFound,
  serverError,
  unauthorized,
  forbidden,
  invalidData,
}

extension HttpErrorExtension on HttpError {
  String get description {
    switch (this) {
      case HttpError.badRequest:
        return 'Campos inválidos. Verifique os dados é envie novamente';
        break;
      default:
        return '';
    }
  }
}
