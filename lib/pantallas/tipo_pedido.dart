import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_con_logo_izq.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';
import 'package:medic_app/pantallas/components/boton_seleccion.dart';

void main() => runApp(const SelecPedidoScreen());

class SelecPedidoScreen extends StatelessWidget {
  const SelecPedidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: const AppBarLogoIzquierda(showX: false),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 30,
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
              const Text(
                'Seleccione el tipo de pedido',
                style: TextStyle(
                  color: Color(0xFF471AA0),
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          BotonSeleccion(texto: 'Sin Receta'),
          const CajaTexto(
            contenido:
                'Puede comprar cualquier producto disponible en el catálogo que no requiera receta médica',
          ),
          // ESPACIADO ENTRE OPCIONES
          const SizedBox(
            height: 80,
          ),
          BotonSeleccion(texto: 'Con Receta'),
          const CajaTexto(
            contenido:
                'Adjunte la receta médica y un encargado se ocupará de enviarle el pedido',
          ),
        ]),
        //bottomNavigationBar: const BarraNavegacion(),
      ),
      // BARRA DE NAVEGACIÓN
    );
  }
}

class CajaTexto extends StatelessWidget {
  final String contenido;

  const CajaTexto({
    super.key,
    required this.contenido,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Text(
          contenido,
          style: const TextStyle(
            color: Color(0xFF5C4F5F),
            fontSize: 17,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ),
    );
  }
}
