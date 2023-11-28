// To parse this JSON data, do
//
//     final producto = productoFromJson(jsonString);

import 'dart:convert';

List<Producto> productoFromJson(String str) => List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToJson(List<Producto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
    final int codigoProducto;
    final String nombreProducto;
    final String descripcion;
    final double precio;
    final int cantidadStock;
    final String imagen;
    final String marca;
    final int codigoCategoria;

    Producto({
        required this.codigoProducto,
        required this.nombreProducto,
        required this.descripcion,
        required this.precio,
        required this.cantidadStock,
        required this.imagen,
        required this.marca,
        required this.codigoCategoria,
    });

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        codigoProducto: (json["codigoProducto"] as num).toInt(),
        nombreProducto: json["nombreProducto"],
        descripcion: json["descripcion"],
        precio: (json["precio"] as num).toDouble(),
        cantidadStock: json["cantidadStock"],
        imagen: json["imagen"],
        marca: json["marca"],
        codigoCategoria: json["codigoCategoria"],
    );

    Map<String, dynamic> toJson() => {
        "codigoProducto": codigoProducto,
        "nombreProducto": nombreProducto,
        "descripcion": descripcion,
        "precio": precio,
        "cantidadStock": cantidadStock,
        "imagen": imagen,
        "marca": marca,
        "codigoCategoria": codigoCategoria,
    };
}
