
// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, duplicate_ignore, prefer_const_constructors

import 'package:flutter/material.dart';

class Minijuego extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(body:Container(child: StateMiniJuego()));
  }


  

}

class StateMiniJuego extends StatefulWidget{
  @override
  Juego createState() => Juego();
  }

// ignore: prefer_typing_uninitialized_variables
var size;
var alturaPantalla;
var anchoPantalla;

  class Juego extends State<StateMiniJuego>{
  @override
  Widget build(BuildContext context) {

    //Recogemos las medidas de la pantalla
    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });
   return MaterialApp(home: Container(
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/FondoMinijuego2.jpg"), fit: BoxFit.cover)),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      // ignore: prefer_const_literals_to_create_immutables
      body: Stack(children: [

        Container(margin: EdgeInsets.only(top: alturaPantalla * 0.9),
          
          child: Image.asset("assets/Derecha.png")),
        Container(
          margin: EdgeInsets.only(top: alturaPantalla * 0.9, left: anchoPantalla * 0.8),
          child: Image.asset("assets/Izquierda.png")),
        Container(
          margin: EdgeInsets.only(top: alty)
          child: Image.asset("assets/diana.png"))








        
      ]),)
   )); 
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  }

