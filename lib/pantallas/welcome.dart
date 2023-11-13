import 'package:flutter/material.dart';

void main() => runApp(const WelcomeApp());

class WelcomeApp extends StatelessWidget {
  const WelcomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: 428,
      height: 926,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFFEDDAF0), Color(0xFFCA53DD), Color(0xFFB83ECC), Color(0xFFC143D6), Color(0xFF530260)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 10,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(45),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 66,
            top: 57,
            child: SizedBox(
              width: 344,
              height: 52,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 344,
                      height: 52,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter ,
                            color: Color(0xFF9747FF),
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 58.17,
                    top: 18,
                    child: SizedBox(
                      width: 265.77,
                      height: 17,
                      child: Text(
                        'Buscar medicamentos, farmacias ...',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 67,
            top: 403,
            child: SizedBox(
              width: 311,
              height: 163,
              child: Text(
                'Hola USUARIO, buenos días',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontFamily: 'Lalezar',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 67,
            top: 613,
            child: SizedBox(
              width: 318,
              height: 56,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 318,
                      height: 56,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 51,
                    top: 19,
                    child: Text(
                      '¿Dónde quieres recibir tu pedido?',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 9,
                    top: 12,
                    child: Container(
                      width: 33,
                      height: 33,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://via.placeholder.com/33x33"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ... (Posicionamiento de otros widgets)
        ],
      ),
    ),
    );
  }
}
