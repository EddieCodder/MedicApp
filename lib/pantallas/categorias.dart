import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_categorias.dart';
import 'package:medic_app/pantallas/components/app_bar_con_logo_izq.dart';

void main() => runApp(const CategorySceen());

class CategorySceen extends StatelessWidget {
  const CategorySceen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      title: 'Material App',
      home: Scaffold(
        extendBodyBehindAppBar: true, // ELIMINAR FONDO DE LA BARRA
        
        appBar: const AppBarCategorias(),          

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [
                Color(0xFFB563DB),
                Color(0xFFDDBEEC),
                Color(0xFFFDFAFE),
                Color(0xFFA39BA7)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
