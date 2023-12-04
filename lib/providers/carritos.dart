import 'package:flutter/material.dart';
import '../models/carrito.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int itemCount() {
    return _items.length;
  }

  double get totalPrice {
    double total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.precio * cartItem.cantidad;
    });
    return total;
  }

  void addTocart(
      int codigoProducto, String nombreProducto, String imagen, double precio) {
    if (_items.containsKey(codigoProducto.toString())) {
      _items.update(
        codigoProducto.toString(),
        (currentProduct) => CartItem(
          codigoProducto: currentProduct.codigoProducto,
          nombreProducto: currentProduct.nombreProducto,
          cantidad: currentProduct.cantidad + 1,
          precio: currentProduct.precio,
          imagen: currentProduct.imagen,
        ),
      );
    } else {
      _items.putIfAbsent(
        codigoProducto.toString(),
        () => CartItem(
          codigoProducto: codigoProducto,
          nombreProducto: nombreProducto,
          cantidad: 1,
          precio: precio,
          imagen: imagen,
        ),
      );
    }
    
    notifyListeners();
  }

  void removeSingleItem(String codigoProducto, {bool isCartButton = false}) {
    if (!_items.containsKey(codigoProducto)) {
      return;
    }
    if (_items[codigoProducto]!.cantidad > 1) {
      _items.update(
        codigoProducto,
        (currentProduct) => CartItem(
          codigoProducto: currentProduct.codigoProducto,
          nombreProducto: currentProduct.nombreProducto,
          cantidad: currentProduct.cantidad - 1,
          precio: currentProduct.precio,
          imagen: currentProduct.imagen,
        ),
      );
    } else if (isCartButton) {
      _items.remove(codigoProducto);
    }
    notifyListeners();
  }

  void remove(int codigoProducto) {
    _items.remove(codigoProducto.toString());
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
