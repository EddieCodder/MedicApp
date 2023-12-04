// To parse this JSON data, do
//
//     final pedido = pedidoFromJson(jsonString);

import 'dart:convert';

List<Pedido> pedidoFromJson(String str) => List<Pedido>.from(json.decode(str).map((x) => Pedido.fromJson(x)));

String pedidoToJson(List<Pedido> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pedido {
    final int codPedCab;
    final int codigoUsuario;
    final DateTime fecha;
    final double precioTotal;
    final int esConReceta;
    final String fotoReceta;
    final String direccionEntrega;
    final String direccionReferencia;
    final int codEstEnt;

    Pedido({
        required this.codPedCab,
        required this.codigoUsuario,
        required this.fecha,
        required this.precioTotal,
        required this.esConReceta,
        required this.fotoReceta,
        required this.direccionEntrega,
        required this.direccionReferencia,
        required this.codEstEnt,
    });

    factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        codPedCab: json["codPedCab"],
        codigoUsuario: json["codigoUsuario"],
        fecha: DateTime.parse(json["fecha"]),
        precioTotal: json["precioTotal"].toDouble(),
        esConReceta: json["esConReceta"],
        fotoReceta: json["fotoReceta"],
        direccionEntrega: json["direccionEntrega"],
        direccionReferencia: json["direccionReferencia"],
        codEstEnt: json["codEstEnt"],
    );

    Map<String, dynamic> toJson() => {
        "codPedCab": codPedCab,
        "codigoUsuario": codigoUsuario,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "precioTotal": precioTotal,
        "esConReceta": esConReceta,
        "fotoReceta": fotoReceta,
        "direccionEntrega": direccionEntrega,
        "direccionReferencia": direccionReferencia,
        "codEstEnt": codEstEnt,
    };
}
