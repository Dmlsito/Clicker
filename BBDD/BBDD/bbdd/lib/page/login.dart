// ignore_for_file: prefer_const_constructors, unnecessary_new, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
 LoginState createState() => LoginState(); 
    

}

class LoginState extends State<Login>{
  String nombre = "";
  String apellido = "";
  String password = "";
  String mensajeError = "";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(appBar: AppBar(
    title: new Center(child: Text("Formulario")),
   ),
   body: Center(child: Padding(
    padding: EdgeInsets.all(50),
    child: Form(
      key: formKey,
      child:Column(
      children: [
           TextFormField(
            decoration: InputDecoration(labelText: "Nombre"),
            onSaved: (value){
              //Restringimos que venga nulo añadiendo la exclamacion al final de la palabra
              nombre = value!;
            },
            validator: (value){
              if(value!.isEmpty){
                return "Campo nombre vacio";
              }
            }
           ),
           SizedBox(height: 10,),
           TextFormField(decoration: InputDecoration(labelText: "Apellidos"),
           onSaved: (value){
              //Restringimos que venga nulo añadiendo la exclamacion al final de la palabra
              apellido = value!;
            },
            validator: (value){
              if(value!.isEmpty){
                return "Campo apellido vacio";
              }
            }),
             SizedBox(height: 0,),
           TextFormField(decoration: InputDecoration(labelText: "Contraseña"),
           onSaved: (value){
              //Restringimos que venga nulo añadiendo la exclamacion al final de la palabra
              password = value!;
            },
            
            validator: (value){
              if(value!.isEmpty){
                return "Campo contraseña vacio";
              }
            }),
            SizedBox(height: 0,),
            
            if(mensajeError.isNotEmpty)
              Text(mensajeError, style: TextStyle(color: Colors.red, 
              fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            
            SizedBox(height: 10,),

            OutlinedButton(onPressed:(){
              loginUser(context);
            }, child: Text("Iniciar sesion")),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("No estas registrado"),
                OutlinedButton(onPressed: (){
                  showRegister(context);
                }, child: Text("Register"))
            
            ],)
             
            
      ],))),) 
   
   
   );
  }
  
  void loginUser(BuildContext context) {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();

      //Llamada a la BBDD
      
      Usuario usuario = new Usuario(
        nombre, apellido, password);
      if(usuario.nombre != ""){
          //Vamos a la ventana de inicio
           Navigator.of(context).pushNamed("/Inicio", arguments: usuario);

      }else{
        setState(() {
          //En caso de que el nombre no exista mostramos un mensaje de error
           mensajeError = "Usuario o contraseña incorrecto";
        });
      }
    }
  }
  
  void showRegister(BuildContext context) {
    Navigator.of(context).pushNamed("/Register");



  }
}


class Usuario{
  String nombre;
  String apellido;
  String password;
  
  Usuario( this.nombre, this.apellido,  this.password);

}

