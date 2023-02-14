// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';

class juego extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: statesJuego()));
  }
}

class statesJuego extends StatefulWidget {
  @override
  Juego createState() => Juego();
}

var size;
var alturaPantalla;
var anchoPantalla;

Timer? timerMoveFish;
Timer? timerGame;

double moveToLeft = anchoPantalla * 0.8;
double anzuelo = anchoPantalla * 0.42;

bool moveToLeftFish = false;
bool moveToRigthFish = false;

int gameCounter = 0;

class Juego extends State<statesJuego> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    alturaPantalla = size.height;
    anchoPantalla = size.width;

    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/fondoPrueba.jpg"),
                    fit: BoxFit.cover)),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: (Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: alturaPantalla * 0.05),
                        child: Text(gameCounter.toString(),
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                    Container(
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.05,
                            left: anchoPantalla * 0.75),
                        width: 80,
                        height: 80,
                        child: InkWell(
                            onTap: () {
                              captured();
                            },
                            child: Image.asset("assets/images/Boton.png"))),
                    Container(
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.05,
                            left: anchoPantalla * 0.4),
                        width: 100,
                        child: Image.asset("assets/images/carrete.png")),
                    Container(
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.00001,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca()),
                    Container(
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.09,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca()),
                    Container(
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.19,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca()),
                    Container(
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.29,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca()),
                    Container(
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.39,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca()),
                    Container(
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.49,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca()),
                    Container(
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.59,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca()),
                    Container(
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.67,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca()),
                    Container(
                        height: 30,
                        width: 80,
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.88, left: anzuelo),
                        child: anzueloPesca()),
                    AnimatedContainer(
                      width: 80,
                      duration: Duration(milliseconds: 100),
                      child: fish(),
                      margin: EdgeInsets.only(
                          top: alturaPantalla * 0.85, left: moveToLeft),
                    )
                  ],
                )))));
  }

  Widget fish() {
    return Image.asset("assets/images/pescado.png");
  }

  Widget acantilado() {
    return Image.asset("assets/images/acantilado.png");
  }

  Widget canaPescar() {
    return Image.asset("assets/images/canaPescar.png");
  }

  Widget hiloDePesca() {
    return Image.asset("assets/images/lineaDePesca.png");
  }

  Widget anzueloPesca() {
    return Image.asset("assets/images/anzuelo.png");
  }

  void moveFish() {
    if (moveToRigthFish) {
      moveToLeft = moveToLeft + 45;
    }
    moveToLeft = moveToLeft - 25;
  }

  void fishMove() {
    timerMoveFish = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (moveToLeft <= anchoPantalla * 0.1) {
          moveToRigthFish = true;
        }
        if (moveToLeft >= anchoPantalla * 0.75) {
          moveToRigthFish = false;
        }
        moveFish();
      });
    });
  }

//Funcion para determinar si ha capturado el pez o no, dentro del if se especifica el hitbox
  void captured() {
    if ((moveToLeft + 80) >= (anzuelo + 50) &&
        (moveToLeft + 80) <= (anzuelo + 70)) {
      Navigator.pushNamed(context, "/secondScreem");
    }
  }

  void starGame() {
    timerGame = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      gameCounter++;
      if (gameCounter >= 20) {
        showDialog(
            barrierColor: Colors.white,
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(actions: <Widget>[
                  Stack(children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Back")),
                    Container(child: Center(child: Text("Has perdido")))
                  ])
                ]));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fishMove();
    starGame();
  }
}
