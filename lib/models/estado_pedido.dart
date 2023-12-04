import 'package:flutter/material.dart';

class Estado with ChangeNotifier {
  final int codEstEnt;
  final String descripcion;

  Estado ({
    required this.codEstEnt,
    required this.descripcion,
  });
}
