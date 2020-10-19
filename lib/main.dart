import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mpsp_virtual_assistant/themes/style.dart';
import 'package:mpsp_virtual_assistant/views/assistant.view.dart';
import 'package:mpsp_virtual_assistant/views/login.view.dart';
import 'package:mpsp_virtual_assistant/views/options.view.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MPSP',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        '/home': (context) => InitialAssistant(),
        '/options': (context) => OptionsView(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
