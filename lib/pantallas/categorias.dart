import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_categorias.dart';
import 'package:medic_app/pantallas/components/barra_busqueda.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';
import 'package:medic_app/pantallas/fondo.dart';
import 'package:medic_app/pantallas/seccion.dart';

void main() => runApp(const CategorySceen());

class CategorySceen extends StatelessWidget {
  const CategorySceen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      home: Scaffold(
        extendBodyBehindAppBar: true, // ELIMINAR FONDO DE LA BARRA
        appBar: AppBarCategorias(),

        body: Stack(
          children: [
            Fondo(),
            Center(
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
                    codigoCategoria1: 1,
                    codigoCategoria2: 2,
                  ),

                  // FILA 2

                  FilaCategorias(
                    name1: 'Belleza',
                    name2: 'Productos Maternos',
                    ruta1: 'assets/belleza.png',
                    ruta2: 'assets/productosMaternos.png',
                    codigoCategoria1: 3,
                    codigoCategoria2: 4,
                  ),

                  // FILA 3
                  FilaCategorias(
                    name1: 'Primeros Auxilios',
                    name2: 'Nutrición',
                    ruta1: 'assets/primerosAuxilios.png',
                    ruta2: 'assets/nutricion.png',
                    codigoCategoria1: 5,
                    codigoCategoria2: 6,
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BarraNavegacion(),
      ),
    );
  }
}

class FilaCategorias extends StatelessWidget {
  final String name1;
  final String name2;
  final int codigoCategoria1;

  final String ruta1;
  final String ruta2;
  final int codigoCategoria2;
  const FilaCategorias(
      {super.key,
      required this.name1,
      required this.name2,
      required this.codigoCategoria1,
      required this.ruta1,
      required this.ruta2,
      required this.codigoCategoria2});

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
            codigoCategoria: codigoCategoria1,
          ),
          CuadroCategory(
            name: name2,
            ruta: ruta2,
            codigoCategoria: codigoCategoria2,
          ),
        ],
      ),
    );
  }
}

class CuadroCategory extends StatelessWidget {
  final String name;
  final String ruta;
  final int codigoCategoria;

  const CuadroCategory({super.key, required this.name, required this.ruta, required this.codigoCategoria});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Widget widget =
            SeccionScreen(nombreRecibido: name, codigoRecibido: codigoCategoria);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ),
        );
      },
      child: Padding(
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
      ),
    );
  }
}
