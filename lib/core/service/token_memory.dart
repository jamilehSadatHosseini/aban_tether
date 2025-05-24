class TokenMemory {
  static String? _token;

  static void set(String? token) {
    _token = token;
  }

  static String? get() => _token;
}