class AppException implements Exception {
  final _message;
  final _prefix ;

  AppException([this._message,this._prefix]);

  @override
  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? super.message]);
}

class BadRequestException extends AppException {
  BadRequestException([String? super.message]);
}

class InternalServerError extends AppException {
  InternalServerError([String? super.message]);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? super.message]);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? super.message]);
}

class InternetException extends AppException {
  InternetException([String? super.message]) ;
}

class RequestTimeOut extends AppException {

  RequestTimeOut([String? super.message]) ;

}
