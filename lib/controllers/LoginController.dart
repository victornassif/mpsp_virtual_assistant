import 'dart:convert';

import '../user.dart';
import 'package:http/http.dart' as http;

class LoginController {
  var url = "https://10.0.2.2:5001/api/Auth/auth";

  Future login(login, password) async {
    var res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        // 'user': user,
        // 'password': pas sword
        'login': login,
        'senha': password
      }),
    );

    print(res);
    user.name = null;
    user.email = null;
    user.token = null;
  }

  Future logout() async {
    user = new IUser();
  }
}
