// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';

class juego extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: statesJuego()));
  }}


class statesJuego extends StatefulWidget{
  @override
 Juego  createState() => Juego();
}


var size;
var alturaPantalla;
var anchoPantalla;
Timer? timerMoveFish;

double moveToLeft = anchoPantalla * 0.4;

bool moveToLeftFish = false;
bool moveToRigthFish = false;

 

class Juego extends State<statesJuego>{
  @override
  Widget build(BuildContext context) {
    
    size = MediaQuery.of(context).size;
    alturaPantalla = size.height;
    anchoPantalla = size.width;
    
    return MaterialApp(
      home: Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/fondoPrueba.jpg"), fit: BoxFit.cover)),
      child:Scaffold(
        backgroundColor: Colors.transparent,
      body: (
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: alturaPantalla * 0.52),
              height: 200,
            child: acantilado()),
            Container(
              height: 200,
              margin: EdgeInsets.only(top:alturaPantalla * 0.4, left: 20),
              child: canaPescar()),
            Container(
              margin: EdgeInsets.only(top:alturaPantalla * 0.28, left: anchoPantalla * 0.44  ),
              width: 90,
              height: 300,
              child: hiloDePesca()),
              Container(
              margin: EdgeInsets.only(top:alturaPantalla * 0.39, left: anchoPantalla * 0.44  ),
              width: 90,
              height: 300,
              child: hiloDePesca()),
               Container(
              margin: EdgeInsets.only(top:alturaPantalla * 0.50, left: anchoPantalla * 0.44  ),
              width: 90,
              height: 300,
              child: hiloDePesca()),
                Container(
              margin: EdgeInsets.only(top:alturaPantalla * 0.61, left: anchoPantalla * 0.44  ),
              width: 90,
              height: 300,
              child: hiloDePesca()),
              Container(
                margin:EdgeInsets.only(top: alturaPantalla * 0.8),
                child: anzuelo()),

            AnimatedContainer(  
              width: 80,
              duration: Duration(milliseconds: 200),
              child: fish(),
              margin: EdgeInsets.only(top: alturaPantalla * 0.85, left: moveToLeft),)
        ],)))
    ));

    
  }
  Widget fish() {
    return Image.asset("assets/images/pescado.png");
  }
  Widget acantilado(){
    return Image.asset("assets/images/acantilado.png");
  }
  Widget canaPescar(){
    return Image.asset("assets/images/canaPescar.png");
  }
  Widget hiloDePesca(){
    return Image.asset("assets/images/lineaDePesca.png");
  }
   Widget anzuelo(){
    return Image.asset("assets/images/anzuelo.png");
  }

 
  void moveFish(){

    if(moveToRigthFish){
       moveToLeft += 30;
    }
    moveToLeft -= 20 ;

  }

  void fishMove(){
    timerMoveFish = Timer.periodic(Duration(milliseconds: 500), (timer) { 
       
       setState(() {
        
        moveFish();
        if(moveToLeft < anchoPantalla * 0.05){
          moveToRigthFish = true;
        }
        if(moveToLeft > anchoPantalla * 0.7){
          moveToRigthFish = false;
        }
        
       

    /*
    if(moveToLeft == anchoPantalla * 0.7){
      moveToLeftFish = false;
      moveToRightFish = true;
    }
    if(moveToRightFish){
      moveRight();
    }
    if(moveToLeft == anchoPantalla * 0.2){
      moveToRightFish = false;
      moveToLeftFish = true;
    }
    */
    });
});
  }
       @override
  void initState() {
    super.initState();
    fishMove();
  
  }

}