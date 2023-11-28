import 'package:flutter/material.dart';

class BotonGuardado extends StatelessWidget {
  final String text;
  const BotonGuardado({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 121,
      height: 43,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [
            Color.fromARGB(255, 132, 61, 191),
            Color.fromARGB(255, 209, 167, 229)
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFFCF4FF),
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }
}
