
class ServerException implements Exception {
  final String message;
  const ServerException({required this.message});
}

class CacheException implements Exception {
  final String message;
  const CacheException({this.message = "خطایی در حافظه پنهان رخ داده است."});
}

