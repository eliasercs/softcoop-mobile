class LogIn {
  static final LogIn _instance = LogIn._internal();

  LogIn._internal();

  factory LogIn() {
    return _instance;
  }

  Future<bool> isValidToken(String token) async {
    if (token == "") return false;
    // Validar token en el backend
    return true;
  }
}
