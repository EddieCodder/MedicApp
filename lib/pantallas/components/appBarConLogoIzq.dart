import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/welcome.dart';

class AppBarLogoIzquierda extends StatelessWidget
    implements PreferredSizeWidget {
  // Permite ver o no la imagen de x
  final bool showX;
  const AppBarLogoIzquierda({super.key, required this.showX});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // LOGO APP CON TEXTO
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomeScreen(),
              ),
            );
          },
          child: Row(
            children: [
              Image.asset('assets/logoApp.png', height: 80),
              const SizedBox(width: 8),
              const Text(
                'MedicApp',
                style: TextStyle(
                  color: Color(0xFF471AA0),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 5,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),

        // BOTON DE X
        showX
            ? // Si el valor está desactivado no se muestra la x
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                },
                child: Container(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  //children: [
                  height: 80,
                  width: 50,
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/x.png', height: 50),
                  //SizedBox(width: 8),
                  //],
                ),
              )
            : const SizedBox(
                height: 80,
                width: 50,
              )
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 50.0); // Altura deseada
}
