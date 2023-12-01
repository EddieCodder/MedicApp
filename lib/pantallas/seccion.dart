import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_menu_logo.dart';
import 'package:medic_app/pantallas/components/barra_busqueda.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';
import 'package:medic_app/pantallas/components/boton_seleccion_producto.dart';

void main() => runApp(SeccionScreen());

// ignore: must_be_immutable
class SeccionScreen extends StatelessWidget {
  String name;

  SeccionScreen({super.key, String? nombreRecibido})
      : name = nombreRecibido ?? "Sección";

  //const SeccionScreen({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      home: Scaffold(
        extendBodyBehindAppBar: true, // ELIMINAR FONDO DE LA BARRA
        appBar: const AppBarMenuLogo(),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [
                    Color.fromARGB(255, 234, 213, 245),
                    Color.fromARGB(255, 229, 208, 240),
                    Color.fromARGB(255, 200, 160, 213),
                    Color.fromARGB(255, 147, 109, 166)
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const BarraBusqueda(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: const Color(0xFF471AA0),
                      iconSize: 15,
                      padding: const EdgeInsets.only(left: 30),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF471AA0),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),

              ],
            ),

            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 200,),
                  Expanded(child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          BotonSeleccionProducto(
                            texto: 'Amoxicilina', disp: true,
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      );
                    },
                  ))
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
