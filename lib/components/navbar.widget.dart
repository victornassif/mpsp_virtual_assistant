import 'package:flutter/material.dart';
import 'package:mpsp_virtual_assistant/controllers/LoginController.dart';
import 'package:mpsp_virtual_assistant/user.dart';
import 'package:mpsp_virtual_assistant/views/assistant.view.dart';
import 'package:mpsp_virtual_assistant/views/login.view.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    var login = user.logado
        ? ListTile(
            trailing: Icon(Icons.exit_to_app),
            title: Text(
              'logout',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            onTap: () {
              LoginController().logout().then((data) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ),
                );
              }); // TRATAR POSSÍVEL ERRO
            },
          )
        : ListTile(
            trailing: Icon(Icons.exit_to_app),
            title: Text(
              'login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginView(),
                ),
              );
            }); // TRATAR POSSÍVEL ERRO

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * 0.3,
            child: DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
          ),
          ListTile(
            trailing: Icon(Icons.assistant_photo),
            title: Text(
              'assistente',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InitialAssistant(),
                ),
              );
            },
          ),
          login
        ],
      ),
    );
  }
}
