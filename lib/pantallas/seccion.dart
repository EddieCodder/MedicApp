import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_menu_logo.dart';
import 'package:medic_app/pantallas/components/barra_busqueda.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';
import 'package:medic_app/pantallas/components/boton_seleccion_producto.dart';
import 'package:medic_app/pantallas/tipo_pedido.dart';
import 'package:medic_app/providers/productos.dart';
import 'package:provider/provider.dart';

void main() => runApp(SeccionScreen());

// ignore: must_be_immutable
class SeccionScreen extends StatelessWidget {
  String name;
  int codigoCategoria;

  SeccionScreen({super.key, String? nombreRecibido, int? codigoRecibido})
      : name = nombreRecibido ?? "Sección",
        codigoCategoria = codigoRecibido ?? 0;

  //const SeccionScreen({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    final productosProvider = Provider.of<Productos>(context, listen: false);
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelecPedidoScreen(),
                          ),
                        );
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
                  const SizedBox(
                    height: 200,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: productosProvider.list.length,
                    itemBuilder: (context, index) {
                      final producto = productosProvider.list[index];
                      if (producto.codigoCategoria != codigoCategoria) {
                        return Container();
                      }
                      return Column(
                        children: [
                          BotonSeleccionProducto(
                            imagen: "http://ivelitaunsa201920210.c1.is/api_medicapp/product/${producto.imagen}",
                            codigoProducto: producto.codigoProducto,
                            texto: producto.nombreProducto,
                            precio: producto.precio,
                            disp: producto.cantidadStock > 0,
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
