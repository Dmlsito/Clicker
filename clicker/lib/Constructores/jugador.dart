// ignore_for_file: unnecessary_this

class Jugador {
  int idJugador;
  int monedas;
  int monstruo;
  int mundo;

  Jugador(
      {required this.idJugador,
      required this.monedas,
      required this.monstruo,
      required this.mundo});

  int getidJugador() {
    return this.idJugador;
  }

  int getMonedas() {
    return this.monedas;
  }

  int getMonstruo() {
    return this.monstruo;
  }

  int getMundo() {
    return this.mundo;
    
  }
}