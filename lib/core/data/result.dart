class Result<T> {
  final T? data;
  final String? errorMessage;

  Result.success([this.data]) : errorMessage = null;
  Result.failure(this.errorMessage) : data = null;
  Result.isNotFound(this.errorMessage) : data = null;

  bool get isSuccess => errorMessage == null;
  bool get isNotFound => !isSuccess;
  bool get isFailure => !isSuccess && !isNotFound;
}