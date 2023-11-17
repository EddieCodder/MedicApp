import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/appBarConLogoIzq.dart';

void main() => runApp(const MenuScreen());

class MenuScreen extends StatelessWidget {
  const MenuScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      title: 'Material App',
      home: Scaffold(

        appBar: AppBarLogoIzquierda(showX: true), // Barra con Logo a la Izquierda con (X)

        // ---------------------------------------------------------------------

      ),
    );
  }
}