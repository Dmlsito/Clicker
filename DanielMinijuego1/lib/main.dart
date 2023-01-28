import 'package:flutter/material.dart';
import 'package:minijuego1/minijuego1.dart/prueba.dart';

import 'minijuego1.dart/juego.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clicker",
      initialRoute: "/Minijuego1",
      routes: {
        "/Minijuego1": (BuildContext context) => Minijuego1(),
        "/Prueba": (BuildContext context) => Prueba()
      },
    );
  }
}
