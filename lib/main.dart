import 'package:flutter/material.dart';
import './routes/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Client App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const LoginPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'QuickSand',
      ),
    );
  }
}