import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_categorias.dart';
import 'package:medic_app/pantallas/components/app_bar_con_logo_izq.dart';
import 'package:medic_app/pantallas/components/barra_busqueda.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';

void main() => runApp(const CategorySceen());

class CategorySceen extends StatelessWidget {
  const CategorySceen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      home: Scaffold(
        extendBodyBehindAppBar: true, // ELIMINAR FONDO DE LA BARRA
        appBar: const AppBarCategorias(),

        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [
                    Color.fromARGB(255, 162, 130, 178),
                    Color.fromARGB(255, 237, 227, 242),
                    Color.fromARGB(255, 255, 255, 255),
                    Color(0xFFFDFAFE),
                    Color.fromARGB(255, 147, 109, 166)
                  ],
                ),
              ),
            ),
            const Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                  ),
                  BarraBusqueda(),
                  SizedBox(
                    height: 50,
                  ),

                  // FILA 1
                  FilaCategorias(
                    name1: 'Aseo Personal',
                    name2: 'Medicamentos',
                    ruta1: 'assets/medicamentos.png',
                    ruta2: 'assets/aseoPersonal.png',
                  ),

                  // FILA 2

                  FilaCategorias(
                    name1: 'Belleza',
                    name2: 'Productos Maternos',
                    ruta1: 'assets/belleza.png',
                    ruta2: 'assets/productosMaternos.png',
                  ),

                  // FILA 3
                  FilaCategorias(
                    name1: 'Primeros Auxilios',
                    name2: 'Nutrición',
                    ruta1: 'assets/primerosAuxilios.png',
                    ruta2: 'assets/nutricion.png',
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: const BarraNavegacion(),
      ),
    );
  }
}

class FilaCategorias extends StatelessWidget {
  final String name1;
  final String name2;

  final String ruta1;
  final String ruta2;
  const FilaCategorias({
    super.key,
    required this.name1,
    required this.name2,
    required this.ruta1,
    required this.ruta2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CuadroCategory(
            name: name1,
            ruta: ruta1,
          ),
          CuadroCategory(
            name: name2,
            ruta: ruta2,
          ),
        ],
      ),
    );
  }
}

class CuadroCategory extends StatelessWidget {
  final String name;
  final String ruta;

  const CuadroCategory({super.key, required this.name, required this.ruta});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            width: 167,
            height: 153,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(ruta),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Container(
            width: 167,
            height: 58,
            decoration: const ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0x002F084F), Color(0xFFA472CE)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
