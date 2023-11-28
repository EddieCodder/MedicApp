import 'package:flutter/material.dart';

class CampoTextoBasico extends StatelessWidget {
  final String text;
  final double alto;
  const CampoTextoBasico({
    super.key, required this.text, required this.alto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 390,
        height: alto,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Color(0xFF9747FF)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: TextField(
          keyboardType: TextInputType.multiline,
          style: TextStyle(
            color: Colors.black.withOpacity(0.3),
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0), // Ajusta los valores según sea necesario
          ),
        ));
  }
}
