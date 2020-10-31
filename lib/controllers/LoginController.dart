import 'dart:convert';
import '../user.dart';
import 'package:http/http.dart' as http;

class LoginController {
  var url = "https://uapi-mpsp.azurewebsites.net/api/Auth/auth";

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
    Map<String, dynamic> jsonRes = json.decode(res.body);

    if (jsonRes['authenticated'] == true) {
      user.name = jsonRes['userName'];
      user.email = jsonRes['login'];
      user.token = jsonRes['accessToken'];
    } else {
      throw("Usuário ou senha inválidos!");
    }
  }

  Future logout() async {
    user = new IUser();
  }
}
