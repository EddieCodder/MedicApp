import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_con_logo_izq.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/components/boton_guardar.dart';
import 'package:medic_app/pantallas/direccion.dart';
import 'package:medic_app/pantallas/tipo_pedido.dart';

void main() => runApp(const CompraRecetaScreen());

class CompraRecetaScreen extends StatelessWidget {
  const CompraRecetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const AppBarLogoIzquierda(
          showX: false,
        ),
        body: Column(
          children: [
            const BarraRetorno(
              text: 'Regresar',
              widget_viaje: SelecPedidoScreen(),
              tamLetra: 24,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Con Receta',
              style: TextStyle(
                color: Color(0xFF471AA0),
                fontSize: 30,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Cargar imagen',
              style: TextStyle(
                color: Color(0xFF471AA0),
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 50 * 0.03),
            InkWell(
              onTap: () {
                // TODO: Hacer la función de recibir imagen
              },
              child: Container(
                width: 254,
                height: 254,
                decoration: ShapeDecoration(
                  color: const Color(0x00D9D9D9),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Image.asset('assets/insertarImagen.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 249,
              height: 126,
              child: Text(
                'Adjunte la imagen de su receta médica para hacer el pedido',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5C4F5F),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Text(
              'Tome una foto',
              style: TextStyle(
                color: Color(0xFF471AA0),
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            Image.asset(
              'assets/camara.png',
            ),
            const SizedBox(
              height: 30,
            ),
            const BotonBasic(text: 'Continuar',pantalla: DireccionScreen(ingresoDesdeBienvenida: false,), ),
          ],
        ),
      ),
    );
  }
}
