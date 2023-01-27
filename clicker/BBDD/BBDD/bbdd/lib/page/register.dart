import 'package:bbdd/page/conexoin/connectionUser.dart';
import 'package:bbdd/page/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget{
  @override
  RegisterState createState()=> RegisterState(); 
}
class RegisterState extends State<Register>{

  String nombre = "";
  String apellido = "";
  String password = "";
  
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
           
            
            
            
            SizedBox(height: 10,),

            OutlinedButton(onPressed:(){
              registerUser(context);
            }, child: Text("Register")),

            
            
      ],))),) 
   
   
   );
  }
  
  void registerUser(BuildContext context) async {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();

      //Llamada a la BBDD
      
      Usuario usuario = new Usuario(
      nombre, apellido, password);
      ConnectionUser conexion  = new ConnectionUser();

      //Como esto va a esperar a la BBDD tiene que llevar await

      bool registro = await conexion.register(usuario) as bool;


      if(usuario.nombre != ""){
          //Vamos a la ventana de inicio
      }
      Navigator.of(context).pushNamed("/Login");
    }
  }
  
 }
