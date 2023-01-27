// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bbdd/page/login.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    final user = ModalRoute.of(context)!.settings.arguments as Usuario;
    
    return Scaffold(appBar: AppBar(title: Text("Inicio")),
    body: Center(child:
    Column(
      mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
      children: [
        Column(children: [
          Container(
            width: 150,
            height: 150,
            child: Icon(Icons.person, size: 130)
          ),

          Text(user.nombre, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          Text(user.apellido, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          
        ],)



      
    ],)));
  }
}  