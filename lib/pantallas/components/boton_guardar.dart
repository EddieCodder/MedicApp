import 'package:flutter/material.dart';

class BotonBasic extends StatelessWidget {
  final Widget pantalla;
  final String text;
  const BotonBasic({
    super.key,
    required this.text,
    required this.pantalla,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pantalla,
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}
