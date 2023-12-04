import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/pedido.dart';

class Pedidos with ChangeNotifier {
  List<Pedido> _items = [];

  List<Pedido> get items {
    return [..._items];
  }

  Future<void> getPedidos() async {
    final url = Uri.parse('http://ivelitaunsa201920210.c1.is/api_medicapp/order/orders.php');

    try {
      final response = await http.get(url);
      if (jsonDecode(response.body) != null) {
        final data = jsonDecode(response.body);
        final List<Pedido> loadedPedidos = [];
        data.forEach((data) {
          loadedPedidos.add(Pedido.fromJson(data));
        });

        _items = loadedPedidos;
        notifyListeners();
      }
    } catch (e) {
      // No imprimir mensajes de error en el modo de depuración
      assert(() {
        print('Error de conexión: $e');
        return true;
      }());
    }
  }

  Future<void> addPedido(int? codigoUsuario, double precioTotal,
      {String direccionReferencia = "No definido",
      String direccionEntrega = "No definido",
      String imagePath = ""}) async {
    final url =
        Uri.parse('http://ivelitaunsa201920210.c1.is/api_medicapp/order/createOrder.php');
    try {
      var request = http.MultipartRequest('POST', url);

      // Agregar campos de texto
      request.fields['codigoUsuario'] = codigoUsuario.toString();
      request.fields['precioTotal'] = precioTotal.toString();
      request.fields['direccionEntrega'] = direccionEntrega;
      request.fields['direccionReferencia'] = direccionReferencia;

      // Agregar archivo de imagen
      if (imagePath.isNotEmpty) {
        var file = await http.MultipartFile.fromPath('imagen', imagePath);
        request.files.add(file);
      }

      var response = await request.send();

      // Leyendo respuesta
      var responseBody = await response.stream.bytesToString();
      print('Response from server: $responseBody');

      // Intentar decodificar la respuesta JSON
      try {
        final newPedido = Pedido.fromJson(jsonDecode(responseBody));
        _items.add(newPedido);
        notifyListeners();
      } catch (error) {
        print('Error decoding JSON: $error');
      }
    } catch (error) {
      // throw error;
      rethrow;
    }
  }

  Future<void> cambiarEstado(int codPedCab, int codEstEnt) async {
    final url =
        Uri.parse('http://ivelitaunsa201920210.c1.is/api_medicapp/order/updateOrderStatus.php');
    final pedidoIndex = _items.indexWhere(
      (pedido) => pedido.codPedCab == codPedCab,
    );
    if (pedidoIndex >= 0) {
      try {
        final response = await http.post(
          url,
          body: {
            'codPedCab': codPedCab.toString(),
            'codEstEnt': codEstEnt.toString(),
          },
        );
        Pedido updatePedido = Pedido.fromJson(jsonDecode(response.body));
        _items[pedidoIndex] = updatePedido;
        notifyListeners();
      } catch (error) {
        rethrow;
      }
    }
  }

  Future<void> llenarPedidosReceta(int codPedCab, double precioTotal) async {
    final url =
        Uri.parse('http://ivelitaunsa201920210.c1.is/api_medicapp/order/updateOrderPrice.php');
    final pedidoIndex = _items.indexWhere(
      (pedido) => pedido.codPedCab == codPedCab,
    );
    if (pedidoIndex >= 0) {
      try {
        final response = await http.post(
          url,
          body: {
            'codPedCab': codPedCab.toString(),
            'precioTotal': precioTotal.toString(),
          },
        );
        Pedido updatePedido = Pedido.fromJson(jsonDecode(response.body));
        _items[pedidoIndex] = updatePedido;
        notifyListeners();
      } catch (error) {
        rethrow;
      }
    }
  }
}
