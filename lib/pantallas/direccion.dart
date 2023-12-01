import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_con_logo_izq.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/components/field_basic.dart';
import 'package:medic_app/pantallas/tipo_pedido.dart';


class DireccionScreen extends StatelessWidget {

  final bool ingresoDesdeBienvenida; 

  const DireccionScreen({super.key, required this.ingresoDesdeBienvenida});

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
            ),
            const SizedBox(
              height: 70,
            ),
            const CampoTextoBasico(
              text: 'Dirección',
              alto: 60,
            ),
            const SizedBox(
              height: 40,
            ),
            const CampoTextoBasico(
              text: 'Referencia',
              alto: 150,
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                onPressed: () {
                  // TODO: USAR LA UBICACIÓN DE LA CUENTA
                },
                child: const Text(
                  'Usar ubicación de la cuenta',
                  style: TextStyle(
                    color: Color(0xFF9651CF),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )),

          
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: ingresoDesdeBienvenida,
              child: const Text(
                'O',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5C4F5F),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: ingresoDesdeBienvenida,
              child: TextButton(
                onPressed: () {
                  // TODO: USAR LA UBICACIÓN ACTUAL
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/ubiActual.png'),
                    const SizedBox(
                        width: 8.0), // Espacio entre la imagen y el texto
                    const Text(
                      'Usar ubicación actual',
                      style: TextStyle(
                        color: Color.fromARGB(255, 122, 57, 175),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

                      const SizedBox(
              height: 50,
            ),
            InkWell(
                onTap: () {
                  // TODO: REALIZAR PEDIDO
                },
                child: Container(
                  width: 270,
                  height: 65,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF9550CE), Color(0xFFEAD0F6)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Realizar Pedido',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
