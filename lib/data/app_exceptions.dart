class appException implements Exception {
  final message;
  final _prefix;
  appException([this.message, this._prefix]);

  @override
  String toString() {
    return '$message $_prefix';
  }
}

class FetchDataException extends appException {
  FetchDataException([String? message])
      : super(message, 'Error While Communicating');
}

class BadRequestException extends appException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorizedException extends appException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized Request');
}

class InvalidInputException extends appException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
