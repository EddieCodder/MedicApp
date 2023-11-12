import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Tamaño de la pantalla del celular

    return Scaffold(
      body: Container(
        width: double.infinity, // Desde el principio de la pantalla
        height: double.infinity, // Desde el principio de la pantalla
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Stack(
          // Conjunto de widgets
          children: [
            // Icono Persona - Logo de la App
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Organiza de manera uniforme a los iconos
              children: [
                Image.asset(
                  'assets/logoPersona.png',
                ),

                Image.asset(
                  'assets/logoApp.png',
                ),



              ],
            ),
            // Texto iniciar Sesión
            Positioned(
              top: size.height * 0.4, // Ajuste la posición según sea necesario
              left: size.width * 0.120,
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(
                  color: Color(0xFF471AA0),
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            
            /*Container(
                width: 390,
                height: 50,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFF9747FF)),
                        borderRadius: BorderRadius.circular(15),
                    ),
                ),
            )*/


          ],
        ),
      ),
    );


  }
}
    

