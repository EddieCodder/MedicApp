class CartItem {
  final int codigoProducto;
  final String nombreProducto;
  final int cantidad;
  final double precio;
  final String imagen;

  CartItem(
    {required this.codigoProducto,
    required this.nombreProducto,
    required this.cantidad,
    required this.precio,
    required this.imagen}
  );
}