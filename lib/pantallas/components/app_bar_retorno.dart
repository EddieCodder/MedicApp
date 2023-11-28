import 'package:flutter/material.dart';

void main() => runApp(const BarraRetorno());

class BarraRetorno extends StatelessWidget implements PreferredSizeWidget {
  const BarraRetorno({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: const Color(0xFF471AA0),
              iconSize: 25,
              padding: const EdgeInsets.only(left: 30),
            ),
            const Text(
              'Información de la cuenta',
              style: TextStyle(
                color: Color(0xFF471AA0),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                height: 0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 50.0); // Altura deseada
}
