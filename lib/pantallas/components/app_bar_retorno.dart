import 'package:flutter/material.dart';

class BarraRetorno extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const BarraRetorno({super.key, required this.text});
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
                Navigator.pop(context);
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
