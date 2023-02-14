import 'package:flutter/material.dart';
import 'package:minijuego3/juego.dart';

import 'secondScreem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        title: "MiniJuego3",
        initialRoute: "/Juego",
        routes: {
          "/Juego": (BuildContext context) => juego(),
          "/secondScreem" : (BuildContext context) => secondScreem() });
}
}