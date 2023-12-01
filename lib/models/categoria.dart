import 'package:flutter/material.dart';

class Categoria with ChangeNotifier {
  final int codigoCategoria;
  final String descripcion;

  Categoria({
    required this.codigoCategoria,
    required this.descripcion,
  });
}
