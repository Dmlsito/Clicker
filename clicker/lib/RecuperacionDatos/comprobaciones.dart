import "package:mysql1/mysql1.dart";

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
        "insert into jugador (Mundo, Monstruo, Monedas) value (?, ?, ? )",
        [mundo, monstruo, monedasJugador]);

    //Una vez que se haya realizado el ingreso de datos seteamo a true el booleano
    finalizado = true;
    //Cerramos la conexion
    conexion.close();
    return finalizado;
  }
}
