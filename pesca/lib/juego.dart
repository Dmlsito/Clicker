// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, sort_child_properties_last, curly_braces_in_flow_control_structures

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
Timer? timerCuerda;

Color cuerda1 = Colors.transparent;
Color cuerda2 = Colors.transparent;
Color cuerda3 = Colors.transparent;
Color cuerda4 = Colors.transparent;
Color cuerda5 = Colors.transparent;
Color cuerda6 = Colors.transparent;
Color cuerda7 = Colors.transparent;
Color cuerda8 = Colors.transparent;


double moveToLeft = anchoPantalla * 0.8;
double anzuelo = anchoPantalla * 0.42;
double topAnzuelo =  alturaPantalla * 0.1;

bool moveToLeftFish = false;
bool moveToRigthFish = false;

int gameCounter = 0;
int counter = 0;

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
                      width: 80,
                      margin: EdgeInsets.only(
                            top: alturaPantalla * 0.05,
                            left: anchoPantalla * 0.05),
                         child: InkWell(
                          onTap: () {
                            aparecer();
                          },
                          child: Image.asset("assets/images/canaPescar.png"))),
                    Container(
                      margin: EdgeInsets.only(top: alturaPantalla * 0.15, left: anchoPantalla * 0.08),
                      child:Text("Lanzar", style: TextStyle(fontSize: 20, color: Colors.white))),
                      Container(
                         margin: EdgeInsets.only(top: alturaPantalla * 0.15, left: anchoPantalla * 0.75),
                        child:Text("Recoger", style: TextStyle(fontSize: 20, color: Colors.white))),
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
                    AnimatedContainer(
                    
                      duration: Duration(milliseconds:300),
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.00001,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca1()),
                    AnimatedContainer(
                      
                      duration: Duration(milliseconds: 100),
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.09,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca2()),
                    AnimatedContainer(
                       
                      duration: Duration(milliseconds: 100),
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.19,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca3()),
                    AnimatedContainer(
                      
                      duration: Duration(milliseconds: 100),
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.29,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca4()),
                    AnimatedContainer(
                       
                      duration: Duration(milliseconds: 100),
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.39,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca5()),
                    AnimatedContainer(
                       duration: Duration(milliseconds: 100),
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.49,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca6()),
                    AnimatedContainer(
                       duration: Duration(milliseconds: 100),
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.59,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca7()),
                    AnimatedContainer(
                        duration: Duration(milliseconds: 100 ),
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.67,
                            left: anchoPantalla * 0.42),
                        width: 90,
                        height: 300,
                        child: hiloDePesca8()),
                    Container(
                        height: 30,
                        width: 80,
                        margin: EdgeInsets.only(
                            top: topAnzuelo, left: anzuelo),
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
    return Image.asset("assets/images/siluro.png");
  }

  Widget hiloDePesca1() {
    return Image.asset("assets/images/lineaDePesca.png", color: cuerda1 );
  }
  Widget hiloDePesca2() {
    return Image.asset("assets/images/lineaDePesca.png",color: cuerda2 );
  }
  Widget hiloDePesca3() {
    return Image.asset("assets/images/lineaDePesca.png", color: cuerda3 );
  }
  Widget hiloDePesca4() {
    return Image.asset("assets/images/lineaDePesca.png", color: cuerda4);
  }
  Widget hiloDePesca5() {
    return Image.asset("assets/images/lineaDePesca.png", color: cuerda5 );
  }
  Widget hiloDePesca6() {
    return Image.asset("assets/images/lineaDePesca.png", color: cuerda6 );
  }
  Widget hiloDePesca7() {
    return Image.asset("assets/images/lineaDePesca.png", color: cuerda7);
  }
  Widget hiloDePesca8() {
    return Image.asset("assets/images/lineaDePesca.png", color: cuerda8);
  }

  Widget anzueloPesca() {
    return Image.asset("assets/images/anzuelo.png");
  }
void aparecer(){
  timerCuerda = Timer.periodic(Duration(milliseconds: 100), (timer) {
      counter++;
      setState(() {
        topAnzuelo = topAnzuelo + 85;
        if(topAnzuelo >= alturaPantalla * 0.88){
          topAnzuelo = alturaPantalla * 0.88;
        }
         if(counter == 1)
      cuerda1 = Colors.black;
       if(counter == 2)
      cuerda2 = Colors.black;
       if(counter == 3)
      cuerda3 = Colors.black;
       if(counter == 4)
      cuerda4 = Colors.black;
       if(counter == 5)
      cuerda5 = Colors.black;
       if(counter == 6)
      cuerda6 = Colors.black;
       if(counter == 7)
      cuerda7 = Colors.black;
       if(counter == 8)
      cuerda8 = Colors.black;
      });
     
   });
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
  bool captured() {
    if ((moveToLeft + 80) >= (anzuelo + 50) &&
        (moveToLeft + 80) <= (anzuelo + 70)) {
      Navigator.pushNamed(context, "/secondScreem");
      return true;
    }
    return false;
  }

  void timeControl() {
    timerGame = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      gameCounter++;
      if (gameCounter >= 20 && !captured()) {
        showDialog(
            barrierColor: Colors.white,
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(actions: <Widget>[
                  Stack(children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          gameCounter = 0;
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
   // timeControl();
  }
}
