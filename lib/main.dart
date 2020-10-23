import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mpsp_virtual_assistant/themes/style.dart';
import 'package:mpsp_virtual_assistant/views/assistant.view.dart';
import 'package:mpsp_virtual_assistant/views/login.view.dart';
import 'package:mpsp_virtual_assistant/views/options.view.dart';

Future main() async {
  await DotEnv().load('.env');
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

