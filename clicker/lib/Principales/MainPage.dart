// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../Constructores/Usuario.dart';
import "package:clicker/main.dart";
import 'package:audioplayers/audioplayers.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Container(child: StatesApp()),
    );
  }
}

//Objeto player para la musica
final player = AudioPlayer();

void playFile(String url) {
  player.play(AssetSource(url));
}

class StatesApp extends StatefulWidget {
  @override
  clase1 createState() => clase1();
}

class clase1 extends State<StatesApp> {
  String nombre = '';
  String contrasena = "";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/posible3.gif"), fit: BoxFit.cover)),
          child: Scaffold(
              // Esto es para que el gif de fondo se vea y no este tapado por este background
              backgroundColor: Colors.transparent,
              body: Center(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Text("NelsonEsMiPadre.exe",
                              style: TextStyle(
                                fontSize: 33,
                                fontFamily: "caps",
                              )),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 50, left: 80, right: 80),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
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
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            obscureText: true,
                            decoration:
                                InputDecoration(labelText: "Contraseña"),
                            onSaved: (value) {
                              contrasena = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo vacio';
                              }
                            },
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: OutlinedButton(
                                onPressed: () {
                                  login(context);
                                },
                                child: Text("Login",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey)))),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: OutlinedButton(
                                onPressed: () {
                                  register(context);
                                },
                                child: Text("Register",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey)))),
                        Container(
                          margin: EdgeInsets.only(top: 200, left: 150),
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

  register(BuildContext context) {
    Navigator.of(context).pushNamed("/Register");
  }
}
