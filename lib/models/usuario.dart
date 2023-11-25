// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

List<Usuario> usuarioFromJson(String str) => List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String usuarioToJson(List<Usuario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
    final int codigoUsuario;
    final String nombreUsuario;
    final String correo;
    final String contrasena;
    final String nombre;
    final String apellido;
    final int telefono;
    final String direccion;
    final DateTime fechaNacimiento;
    final String genero;
    final int esAdmin;
    final int esBloqueado;
    final int esAutenticado;

    Usuario({
        required this.codigoUsuario,
        required this.nombreUsuario,
        required this.correo,
        required this.contrasena,
        required this.nombre,
        required this.apellido,
        required this.telefono,
        required this.direccion,
        required this.fechaNacimiento,
        required this.genero,
        required this.esAdmin,
        required this.esBloqueado,
        required this.esAutenticado,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        codigoUsuario: json["codigoUsuario"],
        nombreUsuario: json["nombreUsuario"],
        correo: json["correo"],
        contrasena: json["contrasena"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        genero: json["genero"],
        esAdmin: json["esAdmin"],
        esBloqueado: json["esBloqueado"],
        esAutenticado: json["esAutenticado"],
    );

    Map<String, dynamic> toJson() => {
        "codigoUsuario": codigoUsuario,
        "nombreUsuario": nombreUsuario,
        "correo": correo,
        "contrasena": contrasena,
        "nombre": nombre,
        "apellido": apellido,
        "telefono": telefono,
        "direccion": direccion,
        "fechaNacimiento": "${fechaNacimiento.year.toString().padLeft(4, '0')}-${fechaNacimiento.month.toString().padLeft(2, '0')}-${fechaNacimiento.day.toString().padLeft(2, '0')}",
        "genero": genero,
        "esAdmin": esAdmin,
        "esBloqueado": esBloqueado,
        "esAutenticado": esAutenticado,
    };
}
