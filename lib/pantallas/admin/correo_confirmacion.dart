import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/admin/pedidos_con_receta.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';

class CorreoConfirmacion extends StatelessWidget {
  const CorreoConfirmacion({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [
                    Color.fromARGB(255, 215, 120, 230),
                    Color.fromARGB(255, 251, 246, 251),
                    Color.fromARGB(255, 251, 246, 251),
                    Color.fromARGB(255, 251, 246, 251),
                  ],
                ),
              ),
              child: Column(children: [
                SizedBox(height: size.height * 0.004),
                const BarraRetorno(
                    text: 'Regresar',
                    widget_viaje: PedidosConReceta(),
                    tamLetra: 30),
                SizedBox(height: size.height * 0.05),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.black,
                      size: 440,
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mensaje\nEnviado',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 129, 129, 129),
                        fontSize: 40,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PedidosConReceta(),
                            ),
                          );
                        },
                        extendedPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        elevation: 20,
                        label: const Text(
                          'Continuar',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Inter',
                          ),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 148, 51, 228),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )),
                  ],
                )
              ])),
          bottomNavigationBar: const BarraNavegacion(),
        ));
  }
}
