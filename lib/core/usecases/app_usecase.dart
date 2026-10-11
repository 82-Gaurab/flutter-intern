// Info: For use case with parameter
abstract interface class UseCaseWithParams<SuccessType, Params> {
  Future<SuccessType> call(Params params);
}

// Info: For use case without parameter
abstract interface class UseCaseWithoutParams<SuccessType> {
  Future<SuccessType> call();
}
