import 'package:flutter/material.dart';

class BarraRetorno extends StatelessWidget implements PreferredSizeWidget {
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  final widget_viaje;
  final String text;
  // ignore: non_constant_identifier_names
  const BarraRetorno({super.key, required this.text, required this.widget_viaje});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => widget_viaje,
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: const Color(0xFF471AA0),
              iconSize: 25,
              padding: const EdgeInsets.only(left: 30),
            ),
            Text(
              text,
              style: const TextStyle(
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
