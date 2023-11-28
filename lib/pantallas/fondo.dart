import 'package:flutter/material.dart';

class Fondo extends StatelessWidget {
  const Fondo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [
            Color.fromARGB(255, 234, 213, 245),
            Color.fromARGB(255, 229, 208, 240),
            Color.fromARGB(255, 200, 160, 213),
            Color.fromARGB(255, 147, 109, 166)
          ],
        ),
      ),
    );
  }
}