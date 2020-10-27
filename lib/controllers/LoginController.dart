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
        // 'password': password
        'login': login,
        'senha': password
      }),
    );

    var decodedBody = json.decode(res.body);
    if(decodedBody['authenticated']){
      user.name = decodedBody['userName'].toString();
      user.token = decodedBody['accessToken'].toString();
    }
  }

  Future logout() async {
    user = new IUser();
  }
}
