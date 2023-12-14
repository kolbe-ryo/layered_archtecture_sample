class AppException implements Exception {
  const AppException([this.message = 'エラーが発生しました']);

  final String message;

  @override
  String toString() => message;
}
