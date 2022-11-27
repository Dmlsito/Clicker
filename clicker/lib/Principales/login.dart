// ignore_for_file: prefer_const_constructors, unused_import

import 'package:audioplayers/audioplayers.dart';
import 'package:clicker/Principales/MainPage.dart';
import 'package:flutter/material.dart';
import 'clicker.dart';
import "package:clicker/main.dart";
import '../Constructores/Usuario.dart';

class Register extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Container(child: StatesApp()),
    );
  }
}

final player = AudioPlayer();

void playFile(String url) {
  player.play(AssetSource(url));
}

class StatesApp extends StatefulWidget {
  @override
  clase2 createState() => clase2();
}

class clase2 extends State<StatesApp> {
  String nombre = '';
  String contrasena = "";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Register.gif"), fit: BoxFit.cover)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          margin:
                              EdgeInsets.only(top: 250, left: 80, right: 80),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Nombre",
                            ),
                            onSaved: (value) {
                              nombre = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo vacio';
                              }
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 20, left: 80, right: 80),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            obscureText: true,
                            decoration:
                                InputDecoration(labelText: "Contraseña"),
                            onSaved: (value) {
                              nombre = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo vacio';
                              }
                            },
                          ),
                        ),
                        OutlinedButton(
                            onPressed: () {
                              login(context);
                            },
                            child:
                                Text("Login", style: TextStyle(fontSize: 20))),
                        Container(
                          margin: EdgeInsets.only(top: 195, left: 140),
                          decoration: BoxDecoration(),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: IconButton(
                                  onPressed: (() => setState(() {
                                        player.play(AssetSource("Theme.mp3"));
                                      })),
                                  icon: Icon(Icons.speaker),
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                  child: Text("Play",
                                      style: TextStyle(color: Colors.grey))),
                              Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: IconButton(
                                  onPressed: (() => setState(() {
                                        player.stop();
                                      })),
                                  icon: Icon(Icons.speaker),
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                  child: Text("Stop",
                                      style: TextStyle(color: Colors.grey)))
                            ],
                          ),
                        ),
                      ],
                    )),
              ))),
    );
  }

  login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.of(context).pushNamed("/Clicker",
          arguments: Usuario(nombre: nombre, contrasena: contrasena));
    }
  }
}
