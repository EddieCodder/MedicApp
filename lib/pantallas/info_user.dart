// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/fondo.dart';

void main() => runApp(const UserScreen());

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      home: Scaffold(
        extendBodyBehindAppBar: true, // ELIMINAR FONDO DE LA BARRA
        appBar: BarraRetorno(text: 'Información de la cuenta'),
        body: Stack(children: [
          Fondo(),
        ]),
      ),
    );
  }
}
