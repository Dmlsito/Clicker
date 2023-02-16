import 'package:flutter/material.dart';
import 'package:latas/juego.dart';
import 'package:latas/secondScreem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "MiniJuego2",
        initialRoute: "/Minijuego",
        routes: {
          "/Minijuego": (BuildContext context) => Minijuego(),
          "/secondScreem" : (BuildContext context) => secondScreem() });
  }
}