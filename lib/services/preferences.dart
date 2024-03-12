import "package:shared_preferences/shared_preferences.dart";

class Preferences {
  static final Preferences _instance = Preferences._internal();

  SharedPreferences? _preferences;

  Preferences._internal();

  factory Preferences() {
    SharedPreferences.getInstance().then((value) {
      _instance._preferences = value;
    });

    return _instance;
  }

  String? get authToken => _preferences?.getString("authToken");

  void setAuthToken(String token) {
    _preferences?.setString("authToken", token);
  }
}
