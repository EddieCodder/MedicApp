import 'package:flutter/material.dart';

import '../models/estado_pedido.dart';

class Estados with ChangeNotifier {
  List<Estado> list = [
    Estado(codEstEnt: 0, descripcion: "Pendiente"),
    Estado(codEstEnt: 1, descripcion: "Entregado"),
    Estado(codEstEnt: 2, descripcion: "Cancelado"),
    Estado(codEstEnt: 3, descripcion: "Enviado"),
  ];
}
