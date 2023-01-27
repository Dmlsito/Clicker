import 'package:bbdd/page/inicio.dart';
import 'package:bbdd/page/login.dart';
import 'package:flutter/material.dart';

import 'page/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base de datos',
      initialRoute: "/Login",
      routes: {
        "/Login":(BuildContext context) => Login(),
        "/Register":(BuildContext context) => Register(),
        "/Inicio":(BuildContext context) => Inicio(),
      },
     );}}