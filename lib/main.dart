import 'package:flutter/material.dart';
import 'package:mpsp_virtual_assistant/themes/style.dart';
import 'package:mpsp_virtual_assistant/views/assistant.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MPSP',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: InitialAssistant(),
    );
  }
}

