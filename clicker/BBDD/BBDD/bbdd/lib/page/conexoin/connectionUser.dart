//En esta clase tendremos todas las consultas que vayamos a hacer a la tabla de usuarios

//Las funciones asincronas significan que la funcion va a ejecutar algo que requiere un tiempo de ejecucion para que se ejecute el resultado

import 'package:mysql1/mysql1.dart';

import '../login.dart';

class ConnectionUser{

  //Este tipo de funciones  devolveran un nuevo dato 

  Future<bool> register(Usuario usuario) async{
    
    //Establecemos la conexion
    
    final conexion = await MySqlConnection.connect(
     ConnectionSettings(
      host: "10.0.2.2",
      port: 3307,
      user: "root", 
      db: "formulario"
     )

    ) ;

    bool comprobar = false;
    var result = await conexion.query("insert into usuario (nombre, apellido, password) value (?, ?, ?)", 
   [usuario.nombre, usuario.apellido, usuario.password]
    
    );
    comprobar = true;
    //Cerramos la conexion
    await conexion.close();

    return comprobar;

  }
}