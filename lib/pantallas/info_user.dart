import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/fondo.dart';

void main() => runApp(const UserScreen());

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      title: 'Material App',
      home: Scaffold(
        body: Stack(children: [
          Fondo(),
        ]),
      ),
    );
  }
}


