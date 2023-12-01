import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/carrito.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';
import 'package:medic_app/pantallas/fondo.dart';
import 'package:medic_app/pantallas/seccion.dart';

void main() => runApp(const DetallesProducto());

class DetallesProducto extends StatelessWidget {
  const DetallesProducto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                        image: const DecorationImage(
                          image: AssetImage('assets/amoxicilina.png'),
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
                                  builder: (context) => SeccionScreen()));
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 218,
                            height: 38.06,
                            child: Text(
                              'Amoxicilina',
                              style: TextStyle(
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
                              'Antibiótico para tratar una amplia variedad de infecciones bacterianas, como infecciones del tracto respiratorio y del oído.',
                              style: TextStyle(
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
                              'S/. 4.00',
                              style: TextStyle(
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
                              'Disponible',
                              style: TextStyle(
                                color: Color(0xFF2CC51F),
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
                Container(
                  width: 250,
                  height: 51,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0x00EAD0F6), Color(0xFFEAD0F6)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BotonAumento(text: '-'),
                      Text(
                        'Cantidad',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                      BotonAumento(text: '+'),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 70,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: Container(
                        width: 68,
                        height: 64.27,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFC7BEBE),
                          shape: OvalBorder(),
                        ),
                        child: Image.asset('assets/carrito.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CarritoScreen(),
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
                          '(3) Agregar al carrito S/. 12.00',
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

class BotonAumento extends StatelessWidget {
  final String text;
  const BotonAumento({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // TODO: AUMENTAR LA CANTIDAD DE PRODUCTOS
      },
      child: Container(
        alignment: Alignment.center,
        width: 76,
        height: 65,
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
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
      ),
    );
  }
}
