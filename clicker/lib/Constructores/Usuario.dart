class Usuario {
  String nombre;
  String contrasena;

  Usuario({required this.nombre, required this.contrasena});

  String getNombre() {
    return this.nombre;
  }

  String getContrasena() {
    return this.contrasena;
  }
}
