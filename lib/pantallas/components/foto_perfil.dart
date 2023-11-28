
import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/login.dart';

class FotoPerfil extends StatelessWidget {
  const FotoPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.0,
      height: 125.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFD9D9D9),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const Center(
            child: Text(
              'U',
              style: TextStyle(
                color: Color(0xFF685252),
                fontSize: 100,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()));
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