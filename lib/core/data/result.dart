class Result<T> {
  final T? data;
  final String? errorMessage;
  bool notFound = false;

  Result.success([this.data])
      : errorMessage = null,
        notFound = false;

  Result.failure(this.errorMessage)
      : notFound = false,
        data = null;

  Result.isNotFound(this.errorMessage)
      : data = null,
        notFound = true;

  bool get isSuccess => errorMessage == null;

  bool get isNotFound => !isSuccess && notFound;

  bool get isFailure => !isSuccess && !notFound;
}
