import 'package:flutter/material.dart';
import 'package:nature_care/src/nature_care/plants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      color: Colors.white,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.green,
        accentIconTheme: IconThemeData(color: Colors.white),
      ),
      routes: {
        '/': (context) => SafeArea(child: Plants()),
      },
    );
  }
}
