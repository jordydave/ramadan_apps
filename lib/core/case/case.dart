class Case<T> {
  final T? data;
  final Exception? failure;

  Case({this.data, this.failure});
}

class InitialCase<T> extends Case<T> {}

class LoadingCase<T> extends Case<T> {}

class ExceptionCase<T> extends Case<T> {
  ExceptionCase(Exception e) : super(failure: e);
}

class ErrorCase<T> extends Case<T> {
  ErrorCase(Exception e) : super(failure: e);
}

class LoadedCase<T> extends Case<T> {
  LoadedCase(T result) : super(data: result);
}

class FailedCase<T> extends Case<T> {
  FailedCase(T result) : super(data: result);
}
