import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/producto.dart';

class Productos with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Producto> _list = [];

  List<Producto> get list {
    return [..._list];
  }

  Future<void> getProductos([bool filterByUser = false]) async {
    final url =
        Uri.parse('http://ivelitaunsa201920210.c1.is/api_medicapp/product/products.php');
    try {
      final response = await http.get(url);

      if (jsonDecode(response.body) != null) {
        final data = jsonDecode(response.body);
        final List<Producto> loadedProductos = [];
        data.forEach((data) {
          loadedProductos.add(Producto.fromJson(data));
        });

        _list = loadedProductos;
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

  Future<void> addProducto(Producto producto, String imagePath) async {
    //http formula = Http Endpoint(url) + http so'rovi = natija
    final url = Uri.parse(
        'http://ivelitaunsa201920210.c1.is/api_medicapp/product/createProduct.php');
    try {
      var request = http.MultipartRequest('POST', url);

      // Agregar campos de texto
      request.fields['nombreProducto'] = producto.nombreProducto;
      request.fields['marca'] = producto.marca;
      request.fields['descripcion'] = producto.descripcion;
      request.fields['precio'] = producto.precio.toString();
      request.fields['codigoCategoria'] = producto.codigoCategoria.toString();
      request.fields['cantidadStock'] = producto.cantidadStock.toString();

      // Agregar archivo de imagen
      var file = await http.MultipartFile.fromPath('imagen', imagePath);
      request.files.add(file);

      var response = await request.send();

      // Leyendo respuesta
      var responseBody = await response.stream.bytesToString();
      print('Response from server: $responseBody');

      // Intentar decodificar la respuesta JSON
      try {
        final newProducto = Producto.fromJson(jsonDecode(responseBody));
        _list.add(newProducto);
        notifyListeners();
      } catch (error) {
        print('Error decoding JSON: $error');
      }
    } catch (error) {
      // throw error;
      rethrow;
    }
  }

  Future<void> updateProducto(Producto updateProducto, String imagePath) async {
    final productoIndex = _list.indexWhere(
      (producto) => producto.codigoProducto == updateProducto.codigoProducto,
    );
    if (productoIndex >= 0) {
      final url = Uri.parse(
          'http://ivelitaunsa201920210.c1.is/api_medicapp/product/updateProduct.php');
      try {
        var request = http.MultipartRequest('POST', url);

        // Agregar campos de texto
        request.fields['codigoProducto'] =
            updateProducto.codigoProducto.toString();
        request.fields['nombreProducto'] = updateProducto.nombreProducto;
        request.fields['marca'] = updateProducto.marca;
        request.fields['descripcion'] = updateProducto.descripcion;
        request.fields['precio'] = updateProducto.precio.toString();
        request.fields['codigoCategoria'] =
            updateProducto.codigoCategoria.toString();
        request.fields['cantidadStock'] =
            updateProducto.cantidadStock.toString();

        // Agregar archivo de imagen solo si se proporciona una nueva imagen
        if (!imagePath.startsWith("images")) {
          var file = await http.MultipartFile.fromPath('imagen', imagePath);
          request.files.add(file);
        }

        var response = await request.send();

        // Leyendo respuesta
        var responseBody = await response.stream.bytesToString();
        print('Response from server: $responseBody');

        // Intentar decodificar la respuesta JSON
        try {
          final newProducto = Producto.fromJson(jsonDecode(responseBody));
          _list[productoIndex] = newProducto;
          notifyListeners();
        } catch (error) {
          print('Error decoding JSON: $error');
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> deleteProducto(int id) async {
    final url = Uri.parse(
        'http://ivelitaunsa201920210.c1.is/api_medicapp/product/deleteProduct.php');

    try {
      var deletingProducto =
          _list.firstWhere((producto) => producto.codigoProducto == id);
      final productoIndex =
          _list.indexWhere((producto) => producto.codigoProducto == id);
      _list.removeWhere((producto) => producto.codigoProducto == id);
      notifyListeners();

      final response = await http.post(url, body: {
        'codigoProducto': deletingProducto.codigoProducto.toString(),
        'esAdmin': '1'
      });

      if (response.body != 'Producto y imagen eliminados') {
        _list.insert(productoIndex, deletingProducto);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
