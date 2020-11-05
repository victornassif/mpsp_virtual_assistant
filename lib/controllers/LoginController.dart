import 'dart:convert';
import '../user.dart';
import 'package:http/http.dart' as http;
import '../services/api_config.dart';

class LoginController {
  var url = ApiConfig.url + "Auth/Auth";
  // var url = "https://10.0.2.2:5001/api/Auth/auth";

  Future login(login, password, logado) async {
    var res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'login': login,
        'senha': password
      }),
    );

    print(res);
    Map<String, dynamic> jsonRes = json.decode(res.body);

    if (jsonRes['authenticated'] == true) {
      ApiConfig.setToken(jsonRes['accessToken']);
      user.name = jsonRes['userName'];
      user.email = jsonRes['login'];
      user.token = jsonRes['accessToken'];
      user.logado = logado;
    } else {
      throw("Usuário ou senha inválidos!");
    }
  }

  Future logout() async {
    user = new IUser();
  }
}
