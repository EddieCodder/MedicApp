import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/menu.dart';

class AppBarMenuLogo extends StatelessWidget implements PreferredSizeWidget {
  // Permite ver o no la imagen de x
  const AppBarMenuLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuScreen(),
                    ),
                  );
                },
                child: Image.asset('assets/vector.png'),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Row(
              children: [
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
                const SizedBox(width: 8),
                Image.asset('assets/logoApp.png', height: 80),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 70.0); // Altura deseada
}
