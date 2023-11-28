import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/login.dart';

class FotoPerfil extends StatelessWidget {
  final double tam;

  const FotoPerfil({
    super.key,
    required this.tam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tam,
      height: tam,
      decoration: const ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 1, color: Color(0xFFD6D6D6)),
        ),
        color: Color(0xFFD9D9D9),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Center(
            child: Text(
              'U',
              style: TextStyle(
                color: const Color(0xFF685252),
                fontSize: tam * 0.80,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(tam * 0.01),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: const Icon(
                Icons.edit,
                color: Color.fromARGB(255, 0, 0,
                    0), // Cambia el color del lápiz según tus preferencias
              ),
            ),
          ),
        ],
      ),
    );
  }
}
