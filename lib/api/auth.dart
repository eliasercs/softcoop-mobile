import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:softcoop/services/preferences.dart';

class Auth {
  final String _url = "http://10.0.2.2:8000/";

  Future<dynamic> signIn(Map<String, dynamic> data) async {
    final url = Uri.parse("${_url}api/signin");

    final response = await http.post(url,
        body: jsonEncode(data), headers: {"Content-Type": "application/json"});

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Preferences().setAuthToken(body["token"]);
      return {"msg": body["msg"], "ok": true};
    }
    return {"msg": body["msg"], "ok": false};
  }

  Future<bool> checkToken(String token) async {
    final response = await http
        .get(Uri.parse("${_url}api/token"), headers: {"auth-token": token});

    final data = jsonDecode(response.body);

    return data["ok"];
  }
}
