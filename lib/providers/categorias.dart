import 'package:flutter/material.dart';
import '../models/categoria.dart';

class Categorias with ChangeNotifier {
  List<Categoria> list = [
    Categoria(codigoCategoria: 0, descripcion: "Otros"),
    Categoria(codigoCategoria: 1, descripcion: "Aseo Personal"),
    Categoria(codigoCategoria: 2, descripcion: "Medicamentos"),
    Categoria(codigoCategoria: 3, descripcion: "Belleza"),
    Categoria(codigoCategoria: 4, descripcion: "Productos Maternos"),
    Categoria(codigoCategoria: 5, descripcion: "Primeros Auxilios"),
    Categoria(codigoCategoria: 6, descripcion: "Nutricion"),
  ];
}
