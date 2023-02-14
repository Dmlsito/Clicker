// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, duplicate_ignore, prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Minijuego extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: StateMiniJuego()));
  }
}

class StateMiniJuego extends StatefulWidget {
  @override
  Juego createState() => Juego();
}

// ignore: prefer_typing_uninitialized_variables
var size;
var alturaPantalla;
var anchoPantalla;

Color colorbullet = Colors.transparent;

double moveToLeft = anchoPantalla * 0.4;
double moveToLeftBullet = anchoPantalla * 0.50;
double positionBullet = alturaPantalla * 0.75;
double topCan = (randomAltura.nextDouble() * 500) + 50;
double widthCan = (randomDerecha.nextDouble() * 300) + 50;

int totalCanHits = 0;
int counterFinished = 0;
int counterGame = 0;

Timer? shoot;
Timer? canRestart;
Timer? restart;
Timer? timerGame;

bool disparobullet = false;
bool desaparecerLata = false;

Random randomAltura = Random();
Random randomDerecha = Random();


class Juego extends State<StateMiniJuego> {
  @override
  Widget build(BuildContext context) {
    //Recogemos las medidas de la pantalla
    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });

    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Fondo.gif"), fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              // ignore: prefer_const_literals_to_create_immutables
              body: Stack(children: [
                Container(
                  margin: EdgeInsets.only(top: alturaPantalla * 0.06, left: anchoPantalla * 0.9),

                  child: Text(counterGame.toString(),style: TextStyle(color: 
                  Colors.white, fontSize: 20),)
                ),
                Container(
                    margin: EdgeInsets.only(top: alturaPantalla * 0.9),
                    child: InkWell(
                      child: Image.asset("assets/images/Izquierda.png"),
                      onTap: () {
                        moveLeft();
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(
                        top: alturaPantalla * 0.9, left: anchoPantalla * 0.8),
                    child: InkWell(
                      child: Image.asset("assets/images/Derecha.png"),
                      onTap: () {
                        moveRight();
                      },
                    )),
                AnimatedContainer(
                  width: 70,
                  height: 52,
                  margin: EdgeInsets.only(
                      top: positionBullet, left: moveToLeftBullet),
                  duration: Duration(milliseconds: 100),
                //When the shootBullet is true call the function bullet() 
                  child: disparobullet ? bullet() : null,
                ),
                AnimatedContainer(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(
                        top: alturaPantalla * 0.75, left: moveToLeft),
                    duration: Duration(milliseconds: 60),
                    child: Image.asset("assets/images/escopeta.png")),
                Container(
                    margin: EdgeInsets.only(
                        top: alturaPantalla * 0.9, left: anchoPantalla * 0.4),
                    child: InkWell(
                      child: Image.asset("assets/images/diana.png"),
                      onTap: () {
                        shootGun();
                      },
                    )),
                Container(child: !desaparecerLata ? canContainer() : null)
              ]),
            )));
  }

  Widget bullet() {
    return Image.asset(
      "assets/images/bala.png",
    );
  }

  Widget canContainer() {
    if (totalCanHits <= 5) {
      return Container(
          width: 100,
          height: 70,
          margin: EdgeInsets.only(top: topCan, left: widthCan),
          child: Image.asset("assets/images/zombie.png"));
    }
    return Container();
  }

  double moveRight() {
    setState(() {
      moveToLeft = moveToLeft + 15;
      moveToLeftBullet = moveToLeftBullet + 15;
    });

    return moveToLeft;
  }

  double moveLeft() {
    setState(() {
      moveToLeft = moveToLeft - 15;
      moveToLeftBullet = moveToLeftBullet - 15;
    });
    return moveToLeft;
  }

  void shootGun() {
    //The bullet is visible
    disparobullet = true;

    shoot = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        positionBullet -= 60;
        //Hitbox can
        if (positionBullet <= topCan &&
            moveToLeftBullet >= widthCan &&
            moveToLeftBullet <= (widthCan + 120)) {
          desaparecerLata = true;
          //The bullet is invisible and comes back to the initial position
          disparobullet = false;
          positionBullet = alturaPantalla * 0.75;
          totalCanHits++;
          
          //Restart the can in 1 seconds
          canRestarted();
          timer.cancel();
        }
      });
      if (positionBullet <= 10) {
        setState(() {
          // The bullet hits can and comes back to the initial position
          positionBullet = alturaPantalla * 0.75;
          timer.cancel();
        });
        disparobullet = false;
      }
    });
  }

  void canRestarted() {
    Random randomAncho2 = Random();
    Random randomAltura2 = Random();
    double ancho2 = (randomAncho2.nextDouble() * 300) + 50;
    double altura2 = (randomAltura2.nextDouble() * 500) + 50;
    int counter = 0;
    canRestart = Timer.periodic(Duration(milliseconds: 800), (timer) {
      counter++;
      if (counter == 2) {
        setState(() {
          widthCan = ancho2;
          topCan = altura2;
          desaparecerLata = false;
          timer.cancel();
        });
      }
    });
  }

// Winner Checks
 
  void restartGame(){
    restart = Timer.periodic(Duration(milliseconds: 2000), (timerRestart)  {
      counterFinished++;
      if(counterFinished == 2 ){
        Navigator.pushNamed(context, "/secondScreem");
      }

    } );
  }

  void gameTime(){
    timerGame = Timer.periodic(Duration(seconds: 1), (timer) { 
      setState(() {
        counterGame ++;
        if(counterGame == 20){
          showDialog(
          barrierColor: Colors.white,
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(actions: <Widget>[
                Stack(children: [Container(child: Center(child: Text("Has perdido")))])
              ]));
        }
        if(counterGame == 28 || totalCanHits == 3 ){
          timer.cancel();
          Navigator.pushNamed(context, "/secondScreem");
        }
      });

    });
  }

  @override
  void initState() {
    super.initState();
    gameTime();
  }
}
