// ignore_for_file: unused_local_variable, unnecessary_new, prefer_interpolation_to_compose_strings

import 'package:clicker/Constructores/Usuario.dart';
import 'package:clicker/Constructores/monstruo.dart';
import "package:mysql1/mysql1.dart";

import '../Constructores/jugador.dart';

class Comprobaciones {
//Ingreso de datos de Jugador en BBDD
  Future<bool> ingresarDatosJugador(
      int mundo, int monstruo, int monedasJugador) async {
//Establecemos la conexion
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    bool finalizado = false;

    //Le pasamos la consulta que en este caso sera un insert en la tabla
    var result = await conexion.query(
        "insert into jugador (Monstruo, Mundo, Monedas) value (?, ?, ?)",
        [monstruo, mundo, monedasJugador]);

    //Una vez que se haya realizado el ingreso de datos seteamo a true el booleano
    finalizado = true;
    //Cerramos la conexion
    await conexion.close();
    return finalizado;
  }

  //Retornar DatosJugador
  Future<Usuario> retornarIdUsuario(String nombre) async {
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    Usuario usuario = new Usuario(id: 0, nombre: "", contrasena: "");

    String sql = "select id, nombre, password from usuarios where nombre ='" +
        nombre.toString() +
        "'";

    var resultQuery = await conexion.query(sql);

    if (resultQuery.isNotEmpty) {
      ResultRow row = resultQuery.first;

      usuario = Usuario(id: row[0], nombre: row[1], contrasena: row[2]);
    }
    await conexion.close();
    return usuario;
  }

  //Retorna los datos de la partida del jugador
  Future<Jugador> retornarDatos(Usuario usuario) async {
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    Usuario usuarioPrueba = Usuario(id: 0, nombre: "", contrasena: "");
    //Creamos objeto jugador vacio
    Jugador jugador =
        new Jugador(idJugador: 0, monedas: 0, monstruo: 0, mundo: 0);
    //Variable en la que guardaremos el id de cada usuario
    int idUsuario;
    //Retornamos el usuario
    usuarioPrueba = await retornarIdUsuario(usuario.getNombre());
    //A esta variable, que correspondera al id del usuario que se ha logeado, se le asignara el id del usuario
    idUsuario = usuarioPrueba.id;
    //Ahora  tenemos un usuario con solo el id
    String sql =
        "SELECT jugador.Id_Usuario, jugador.Monedas, jugador.Monstruo, jugador.Mundo  FROM Jugador WHERE jugador.Id_Usuario = '" +
            idUsuario.toString() +
            "'";

    //Realizamos la consulta
    var result = await conexion.query(sql);

    if (result.isNotEmpty) {
      ResultRow row = result.first;

      //Agregamos los datos al objeto Jugador
      jugador = Jugador(
          idJugador: row[0], monedas: row[1], monstruo: row[2], mundo: row[3]);
    }
    await conexion.close();
    //Cuando ya hayamos recogido todos los datos retornamos el jugador
    return jugador;
  }
}
