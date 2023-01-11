//Clase de la conexion a la BBDD
// ignore_for_file: empty_statements, unused_local_variable, unnecessary_new, dead_code, prefer_interpolation_to_compose_strings

import 'package:clicker/Constructores/Usuario.dart';
import "package:mysql1/mysql1.dart";


class ConnectionUser{

  Future<bool> register(Usuario usuario) async{

    //Primero de todo establecemos la conexion

    final conexion = await MySqlConnection.connect(
      ConnectionSettings(
        host: "10.0.2.2",
        port: 3307,
        user: "root",
        db: "nelsonesmipadre"
      )
    );

    bool comprobar = false;
    //Query para insertar los datos del jugador
    var result = await conexion.query("insert into usuario (nombre, contraseña) value (?, ?)",
    [usuario.nombre, usuario.contrasena]);
    
    //Como ya se ha realizado la operacion se setea el booleano a true y se cierra la conexion
    comprobar = true;
    //Cerramos conexion
    await conexion.close();
    return comprobar;
  }

  Future<Usuario> login(String nombre, String contrasena) async{
    
    Usuario usuarioComprobacion = Usuario(nombre: "", contrasena: "");
    
    //Establecemos la conexion
     final conexion = await MySqlConnection.connect(
      ConnectionSettings(
        host: "10.0.2.2",
        port: 3307,
        user: "root",
        db: "nelsonesmipadre"
      )
    );
    String sql = "select * from usuario where nombre = '" +
        nombre +
        "' and contraseña = '" +
        contrasena + 
        "'";

    var comprobarUsuario = await conexion.query(sql);
    
    //Comprobamos que el usuario no esta vacio
    
    if(comprobarUsuario.isNotEmpty){
     ResultRow row = comprobarUsuario.first;
     usuarioComprobacion = new Usuario(nombre: row[1], contrasena: row[2]);
    }
    return usuarioComprobacion;
    
    
   
   

  }
}