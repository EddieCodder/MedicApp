import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/admin/buscar_producto.dart';

import 'package:medic_app/pantallas/fondo.dart';
import 'package:provider/provider.dart';

import '../../providers/carritos.dart';
import '../../providers/productos.dart';

class DetallesProductoReceta extends StatelessWidget {
  final int codigoProducto;
  const DetallesProductoReceta({super.key, required this.codigoProducto});

  @override
  Widget build(BuildContext context) {
    final producto = Provider.of<Productos>(context, listen: false)
        .list
        .firstWhere((p) => p.codigoProducto == codigoProducto);
    final carritoProvider = Provider.of<Cart>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            const Fondo(),
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: 374,
                      height: 355,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "http://ivelitaunsa201920210.c1.is/api_medicapp/product/${producto.imagen}"),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BuscarProductoScreen()));
                        },
                        child: const Icon(
                          size: 50,
                          Icons.cancel,
                          color: Color.fromARGB(255, 0, 0,
                              0), // Cambia el color del lápiz según tus preferencias
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  width: 371,
                  height: 139,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0x00EAD0F6), Color(0xFFEAD0F6)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 218,
                            height: 38.06,
                            child: Text(
                              producto.nombreProducto,
                              style: const TextStyle(
                                color: Color(0xFF080808),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 214,
                            height: 48,
                            child: Text(
                              producto.descripcion,
                              style: const TextStyle(
                                color: Color(0xFF5C4F5F),
                                fontSize: 10,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 116,
                            height: 28,
                            child: Text(
                              'S/. ${producto.precio}',
                              style: const TextStyle(
                                color: Color(0xFF080808),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 81,
                            height: 38.06,
                            child: Text(
                              producto.cantidadStock > 0
                                  ? 'Disponible'
                                  : "No Disponible",
                              style: TextStyle(
                                color: producto.cantidadStock > 0
                                    ? const Color(0xFF2CC51F)
                                    : const Color.fromARGB(255, 197, 31, 31),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),

                const SizedBox(
                  height: 70,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        carritoProvider.addTocart(
                            codigoProducto,
                            producto.nombreProducto,
                            producto.imagen,
                            producto.precio
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BuscarProductoScreen(),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 307,
                        height: 54,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Color(0xFF9550CE), Color(0xFFEAD0F6)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Agregar al carrito',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                // COLUMNA PRINCIPAL
              ],
            )
          ],
        ),
      ),
    );
  }
}
