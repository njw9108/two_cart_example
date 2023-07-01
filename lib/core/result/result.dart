abstract class Result {
  const Result();
}

class ResultSucess<T> extends Result {
  final T resultValue;

  const ResultSucess({
    required this.resultValue,
  });
}

class ResultError extends Result {
  final String message;

  const ResultError({
    required this.message,
  });
}
