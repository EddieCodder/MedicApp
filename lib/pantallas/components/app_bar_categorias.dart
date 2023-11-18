import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/menu.dart';

class AppBarCategorias extends StatelessWidget implements PreferredSizeWidget {
  // Permite ver o no la imagen de x
  const AppBarCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuScreen(),
                    ),
                  );
                },
                child: Image.asset('assets/vector.png'),),
            const SizedBox(
              width: 30,
            ),
            const Text(
              'Categorías',
              style: TextStyle(
                color: Color(0xFF3B1F71),
                fontSize: 40,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 50.0); // Altura deseada
}
