//ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, curly_braces_in_flow_control_structures, unused_element, sort_child_properties_last

import 'dart:async';

import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Minijuego1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: StatesMinijuego1()));
  }
}

var size;
var alturaPantalla;
var anchoPantalla;
double top1 = 50;
double top2 = 50;
double top3 = 50;
double top4 = 50;
double top5 = 50;
double top6 = 50;
double top7 = 50;
double top8 = 50;
double top9 = 50;

double topButton = alturaPantalla * 0.65;

int contador = 0;

bool objeto1Conseguido = false;
bool objeto2Conseguido = false;
bool objeto3Conseguido = false;
bool objeto4Conseguido = false;
bool objeto5Conseguido = false;

bool botonOculto = true;

Timer? timerCaidaObeto;

Timer? timerPartida;

Timer? timerPop;

int contadorTiempo = 0;

class StatesMinijuego1 extends StatefulWidget {
  @override
  juego createState() => juego();
}

String imagenDinero1 = "";
String imagenDinero2 = "";
String imagenDinero3 = "";
String imagenDinero4 = "";
String imagenDinero5 = "";

String imagenEnBlanco = "";

bool controlClickBoton = true;

String imagenDinero1Invisible = "assets/bolsaDinero.png";
String imagenDinero2Invisible = "assets/bolsaDinero.png";
String imagenDinero3Invisible = "assets/bolsaDinero.png";
String imagenDinero4Invisible = "assets/bolsaDinero.png";
String imagenDinero5Invisible = "assets/bolsaDinero.png";

double leftGuide = 60;

List<String> listaImagenesDineroInvisible = [
  imagenDinero1Invisible,
  imagenDinero2Invisible,
  imagenDinero3Invisible,
  imagenDinero4Invisible,
  imagenDinero5Invisible,
];

List<String> listaImagenesDinero = [
  imagenDinero1,
  imagenDinero2,
  imagenDinero3,
  imagenDinero4,
  imagenDinero5
];
int contadorTimerFinal = 0;

class juego extends State<StatesMinijuego1> {
  @override
  Widget build(BuildContext context) {
    int game = 0;
    late Timer timerGame;

    //Funcion que controla el comienzo de la partida, cuando la variable game sea distinto de 0, es decir
    //cuando pase un segundo desde que se llamo a la funcion el timer se cancelara y se llamara a startGamer3()
    void startGame() {
      const oneSec = Duration(milliseconds: 1100);
      timerGame = Timer.periodic(
        oneSec,
        (Timer timerGame) {
          if (game == 0) {
            setState(() {
              leftGuide = 600;
              game++;
            });
          } else {
            //TIMER EMPEZAR JUEGO
            startGame3();
            timerGame.cancel();
          }
        },
      );
    }

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
                    image: AssetImage("assets/Fondo.jpg"), fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  AnimatedContainer(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(
                          top: top1, right: anchoPantalla * 0.88),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(listaImagenesDineroInvisible[0]))),
                      duration: Duration(milliseconds: 500),
                      child: InkWell(
                        onTap: () {
                          //Cada animatedContainer tendra su propio index para poder colocarnos en la posicion correcta
                          //de cada lista
                          int index = 0;
                          //Tendremos que setear a true esta variable para controlar que hemos obtenido
                          //la bolsa de dinero
                          objeto1Conseguido = true;
                          mostrarBolsasDinero(index);
                          desaparecerBolsaDinero(index);
                          //Tendremos que llamar a esta funcion en cada animatedContainer para evaluar si el usuario ha ganado o no
                          ganador(context);
                        },
                      )),
                  AnimatedContainer(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(
                          top: top2, left: anchoPantalla * 0.88),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(listaImagenesDineroInvisible[1]))),
                      duration: Duration(milliseconds: 500),
                      child: InkWell(
                        onTap: () {
                          int index = 1;
                          objeto2Conseguido = true;
                          desaparecerBolsaDinero(index);
                          mostrarBolsasDinero(index);
                          ganador(context);
                        },
                      )),
                  AnimatedContainer(
                      height: 50,
                      width: 50,
                      margin:
                          EdgeInsets.only(top: top3, left: anchoPantalla * 0.5),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(listaImagenesDineroInvisible[2]))),
                      duration: Duration(milliseconds: 500),
                      child: InkWell(
                        onTap: () {
                          int index = 2;
                          objeto3Conseguido = true;
                          desaparecerBolsaDinero(index);
                          mostrarBolsasDinero(index);
                          ganador(context);
                        },
                      )),
                  AnimatedContainer(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(
                          top: top4, left: anchoPantalla * 0.23),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(listaImagenesDineroInvisible[3]))),
                      duration: Duration(milliseconds: 500),
                      child: InkWell(
                        onTap: () {
                          int index = 3;
                          objeto4Conseguido = true;
                          desaparecerBolsaDinero(index);
                          mostrarBolsasDinero(index);
                          ganador(context);
                        },
                      )),
                  AnimatedContainer(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(
                          top: top5, left: anchoPantalla * 0.70),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(listaImagenesDineroInvisible[4]))),
                      duration: Duration(milliseconds: 500),
                      child: InkWell(
                        onTap: () {
                          int index = 4;
                          objeto5Conseguido = true;
                          desaparecerBolsaDinero(index);
                          mostrarBolsasDinero(index);
                          ganador(context);
                        },
                      )),
                  //En este visible esta el boton de comenzar partida, ESTE BOTON NO ESTARA EN LA VERSION FINAL
                  Visibility(
                      visible: botonOculto,
                      child: AnimatedContainer(
                          margin: EdgeInsets.only(
                              top: topButton, left: anchoPantalla * 0.035),
                          width: 400,
                          duration: Duration(milliseconds: 500),
                          child: Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/cartel.png"),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: anchoPantalla * 0.22,
                                    top: alturaPantalla * 0.125),
                                width: 200,
                                child: InkWell(
                                    child: Image.asset("assets/btnStart.png"),
                                    //Este onTap tiene una ternaria, Explicacion ->
                                    //Si el booleano controlClickBoton se llamara a la funcion startGame, esta funcion, como ya se ha explicado antes
                                    //llama al startGame3, que a su vez al cabo de un tiempo llama a la funcion OcultarBoton, esta funcion seteara la variable
                                    //booleana a false, por lo que no cumplira la condicion y una vez pulsado al boton se desactivara con un null
                                    onTap: controlClickBoton
                                        ? (() {
                                            startGame();
                                          })
                                        : null))
                          ]))),
                  Container(
                      margin: EdgeInsets.only(
                        top: alturaPantalla * 0.90,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(listaImagenesDinero[0]))),
                          ),
                          Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(listaImagenesDinero[1])))),
                          Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(listaImagenesDinero[2])))),
                          Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(listaImagenesDinero[3])))),
                          Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(listaImagenesDinero[4]))))
                        ],
                      )),
                  AnimatedPositioned(
                      top: alturaPantalla * 0.5 - ((99 * 0.37 / 2)),
                      // left: widthA0.5-((8540.37)/2),
                      left: leftGuide,
                      duration: const Duration(milliseconds: 1000),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/guide.png"),
                                fit: BoxFit.fitWidth)),
                        width: 738 * 0.37,
                        height: 99 * 0.37,
                      )),
                ],
              ),
            )));
  }

  //Al cabo de dos segundos despues de que el timer de la funcion starGame() finalice se llamaran a todas las funciones

  void startGame3() {
    timerPartida = Timer.periodic(Duration(milliseconds: 500), (timer) {
      contadorTimerFinal++;
      if (contadorTimerFinal == 1) {
        caidaObjeto1();
        caidaObjeto2();
        caidaObjeto3();
        caidaObjeto4();
        caidaObjeto5();
        ocultarBoton();
        timer.cancel();
      }
    });
  }

//Funciones para controlar la caida de los objetos
  double caidaObjeto1() {
    timerCaidaObeto = Timer.periodic(Duration(milliseconds: 500), (timer1) {
      //Creamos un random que es la distancia que recorera cada 500 milisegundos la bolsa de dinero
      Random random = new Random();
      int caida = random.nextInt(100) + 50;

      setState(() {
        top1 += caida;
      });

      //Llegado a un valor minimo en el eje indicamos que se vuelva a su posicion inicial, cambiando el valor del top
      //Esto se reproducira en bucle hasta que la bolsa sea clickada
      if (top1 > alturaPantalla * 0.75) {
        top1 = 50;
      }
    });

    return top1;
  }

  double caidaObjeto2() {
    timerCaidaObeto = Timer.periodic(Duration(milliseconds: 500), (timer2) {
      Random random = Random();
      int caida = random.nextInt(100) + 50;
      if (ganador(context)) {
        top2 = 50;
        timer2.cancel();
      } else {
        setState(() {
          top2 += caida;
        });

        if (top2 > alturaPantalla * 0.75) {
          top2 = 50;
        }
      }
    });

    return top2;
  }

  double caidaObjeto3() {
    timerCaidaObeto = Timer.periodic(Duration(milliseconds: 500), (timer3) {
      Random random = Random();
      int caida = random.nextInt(100) + 50;
      if (ganador(context)) {
        top3 = 50;
        timer3.cancel();
      } else {
        setState(() {
          top3 += caida;
        });

        if (top3 > alturaPantalla * 0.75) {
          top3 = 50;
        }
      }
    });

    return top3;
  }

  double caidaObjeto4() {
    timerCaidaObeto = Timer.periodic(Duration(milliseconds: 500), (timer4) {
      Random random = Random();
      int caida = random.nextInt(100) + 50;
      if (ganador(context)) {
        top4 = 50;
        timer4.cancel();
      } else {
        setState(() {
          top4 += caida;
        });

        if (top4 > alturaPantalla * 0.75) {
          top4 = 50;
        }
      }
    });

    return top4;
  }

  double caidaObjeto5() {
    timerCaidaObeto = Timer.periodic(Duration(milliseconds: 500), (timer5) {
      Random random = Random();
      int caida = random.nextInt(100) + 50;
      if (ganador(context)) {
        top5 = 50;
        timer5.cancel();
      } else {
        setState(() {
          top5 += caida;
        });
        if (top5 > alturaPantalla * 0.75) {
          top5 = 50;
        }
      }
    });

    return top5;
  }
}

// Funcion para detectar al ganador
bool ganador(BuildContext context) {
  if (objeto1Conseguido &&
      objeto2Conseguido &&
      objeto3Conseguido &&
      objeto4Conseguido &&
      objeto5Conseguido) {
    //Una vez que se haya enseñado la pantalla intermedia donde se haya indicado que el usuario ha ganado la partida
    //al cabo de un par de segundos se ejecutara un push al siguiente juego
    timerPop = Timer.periodic(Duration(milliseconds: 2000), (timer) {
      contadorTiempo++;
      if (contadorTiempo == 6) {
        Navigator.of(context).pushNamed("/Prueba");
      }
    });
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              actions: <Widget>[
                Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/fondoFinal.png"),
                            fit: BoxFit.cover)),
                    width: anchoPantalla,
                    height: alturaPantalla * 0.78,
                  ),
                  FadeInDown(
                      duration: Duration(milliseconds: 2000),
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: alturaPantalla * 0.08),
                          child: Text("NIVEL SUPERADO",
                              style:
                                  TextStyle(fontFamily: "art", fontSize: 25)))),
                  Container(
                      margin: EdgeInsets.only(top: alturaPantalla * 0.2),
                      child:
                          Image.asset("assets/cartel.png", fit: BoxFit.cover)),
                  Container(
                      margin: EdgeInsets.only(
                          left: anchoPantalla * 0.25,
                          top: alturaPantalla * 0.33),
                      width: 100,
                      child: Image.asset("assets/Trofeo.png")),
                  Container(
                      width: 100,
                      height: 150,
                      margin: EdgeInsets.only(
                          top: alturaPantalla * 0.6,
                          left: anchoPantalla * 0.55),
                      child: Image.asset("assets/BienHecho.png"))
                ])
              ],
            ));
    return true;
  } else
    return false;
}

// Funcion para detectar que bolsas de dinero estan recogidas
void mostrarBolsasDinero(int index) {
  for (int i = 0; i < listaImagenesDinero.length; i++) {
    listaImagenesDinero[index] = "assets/bolsaDinero.png";
  }
}

// Funcion para hacer desaparecer las bolsas de dinero una vez ya clickadas
void desaparecerBolsaDinero(int index) {
  for (int i = 0; i < listaImagenesDineroInvisible.length; i++) {
    listaImagenesDineroInvisible[index] = " ";
  }
}

//Funcion para ocultar el boton una vez lo hayamos pulsado
//IMPORTANTE -> EN LA VERSION FINAL NO HARA FALTA ESTO
bool ocultarBoton() {
  controlClickBoton = false;
  botonOculto = false;
  return botonOculto;
}
