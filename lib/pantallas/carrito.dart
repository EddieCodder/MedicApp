import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/categorias.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/components/boton_guardar.dart';
import 'package:medic_app/pantallas/detalles_producto.dart';
import 'package:medic_app/pantallas/fondo.dart';
import 'package:medic_app/pantallas/welcome.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: [
          //Fondo(),

          Column(
            children: [
              const BarraRetorno(
                text: 'Mi pedido',
                widget_viaje: DetallesProducto(),
                tamLetra: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const CuadroCompra();
                  },
                ),
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
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilaPrecio(
                    textoIzquierdo: 'Subtotal:',
                    textoDerecho: 'S/ 12.00',
                    tam: 26,
                  ),
                  FilaPrecio(
                    textoIzquierdo: 'Costo/Envío:',
                    textoDerecho: 'S/ 5.00',
                    tam: 26,
                  ),
                  FilaPrecio(
                    textoIzquierdo: 'Total:',
                    textoDerecho: 'S/ 17.00',
                    tam: 32,
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
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
  const CuadroCompra({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    // TODO: Accion de borrar de la ListView
                  },
                  child: const Icon(
                    size: 50,
                    Icons.cancel,
                    color: Color.fromARGB(255, 0, 0,
                        0), // Cambia el color del lápiz según tus preferencias
                  ),
                ),
              ),
              const Cuadro1(alto: 200),
            ],
          ),
          const Cuadro2(
            alto: 130,
          ),
        ],
      ),
    );
  }
}

class Cuadro2 extends StatelessWidget {
  final double alto;
  const Cuadro2({
    super.key,
    required this.alto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.topCenter,
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
            child: Image.asset(
              'assets/amoxicilina.png',
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Amoxicilina',
                style: TextStyle(
                  color: Color(0xFF5C4F5F),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              Text(
                'S/. 4.00 por unidad',
                style: TextStyle(
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
  final double alto;
  const Cuadro1({
    super.key,
    required this.alto,
  });

  @override
  Widget build(BuildContext context) {
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
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            '5 unidades: ',
            style: TextStyle(
              color: Color(0xFF080808),
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          Text(
            'S/ 12.00',
            style: TextStyle(
              color: Color(0xFF080808),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
              height: 0,
            ),
          ),
        ]),
      ),
    );
  }
}
