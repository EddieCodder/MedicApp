import 'package:flutter/material.dart';
import 'package:medic_app/models/carrito.dart';
import 'package:medic_app/pantallas/categorias.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/detalles_producto.dart';
import 'package:medic_app/pantallas/welcome.dart';
import 'package:medic_app/providers/pedidos.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/carritos.dart';

class CarritoScreen extends StatelessWidget {
  final int codigoProducto;
  const CarritoScreen({
    super.key,
    required this.codigoProducto,
  });

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: [
          //Fondo(),

          Column(
            children: [
              BarraRetorno(
                text: 'Mi pedido',
                widget_viaje: DetallesProducto(codigoProducto: codigoProducto),
                tamLetra: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<Cart>(
                builder: (context, cart, child) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final carrito = cart.items.values.elementAt(index);
                        return CuadroCompra(carrito: carrito);
                      },
                    ),
                  );
                  // ... Otros widgets ...
                },
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategorySceen(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 157.85,
                  height: 38,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color.fromARGB(255, 137, 42, 215),
                        Color.fromARGB(255, 196, 125, 228)
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Seguir comprando',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 40,
              ),
              Consumer<Cart>(
                builder: (context, cart, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FilaPrecio(
                        textoIzquierdo: 'Subtotal:',
                        textoDerecho:
                            ((cart.totalPrice * 100).round() / 100).toString(),
                        tam: 26,
                      ),
                      const FilaPrecio(
                        textoIzquierdo: 'Costo/Envío:',
                        textoDerecho: 'S/ 5.00',
                        tam: 26,
                      ),
                      FilaPrecio(
                        textoIzquierdo: 'Total:',
                        textoDerecho:
                            (((cart.totalPrice + 5) * 100).round() / 100)
                                .toString(),
                        tam: 32,
                      )
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  int? codigoUsuario =
                  Provider.of<Auth>(context, listen: false).codigoUsuario;
                  Provider.of<Pedidos>(context, listen: false).addPedido(
                    codigoUsuario,
                    Provider.of<Cart>(context, listen: false).totalPrice
                  );
                  Provider.of<Cart>(context, listen: false).clearCart();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
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
                      colors: [
                        Color.fromARGB(255, 144, 57, 215),
                        Color.fromARGB(255, 162, 56, 211)
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Realizar Pedido',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          )
        ],
      )),
    );
  }
}

class FilaPrecio extends StatelessWidget {
  final String textoIzquierdo;
  final String textoDerecho;
  final double tam;

  const FilaPrecio({
    super.key,
    required this.textoIzquierdo,
    required this.textoDerecho,
    required this.tam,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 80, right: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textoIzquierdo,
            style: TextStyle(
              color: const Color(0xFF080808),
              fontSize: tam,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          Text(
            textoDerecho,
            style: TextStyle(
              color: const Color(0xFF080808),
              fontSize: tam - 2,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class CuadroCompra extends StatelessWidget {
  final CartItem carrito;
  const CuadroCompra({
    super.key,
    required this.carrito,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              Provider.of<Cart>(context, listen: false)
                  .remove(carrito.codigoProducto);
            },
            icon: const Icon(
              Icons.cancel,
              size: 40,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Cuadro2(alto: 130, carrito: carrito),
          Cuadro1(alto: 35, carrito: carrito),
        ],
      ),
    );
  }
}

class Cuadro2 extends StatelessWidget {
  final CartItem carrito;
  final double alto;
  const Cuadro2({
    Key? key,
    required this.alto,
    required this.carrito,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 371,
      height: alto,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: carrito.imagen != ""
                ? Image.network(
                    "http://ivelitaunsa201920210.c1.is/api_medicapp/product/${carrito.imagen}",
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                carrito.nombreProducto,
                style: const TextStyle(
                  color: Color(0xFF5C4F5F),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              Text(
                'S/. ${carrito.precio} por unidad',
                style: const TextStyle(
                  color: Color(0xFF5C4F5F),
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Cuadro1 extends StatelessWidget {
  final CartItem carrito;
  final double alto;
  const Cuadro1({
    Key? key,
    required this.alto,
    required this.carrito,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num subtotal = carrito.precio * carrito.cantidad;

    return Container(
      alignment: Alignment.bottomCenter,
      width: 371,
      height: alto,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              carrito.cantidad.toString(),
              style: const TextStyle(
                color: Color(0xFF080808),
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            Text(
              subtotal.toString(),
              style: const TextStyle(
                color: Color(0xFF080808),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
