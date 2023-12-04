import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/components/barra_busqueda.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';
import 'package:medic_app/pantallas/fondo.dart';
import 'package:medic_app/pantallas/menu.dart';
import 'package:medic_app/providers/auth.dart';
import 'package:medic_app/providers/estados.dart';
import 'package:provider/provider.dart';

import '../models/pedido.dart';
import '../providers/pedidos.dart';

//void main() => runApp(const MisPedidosScreen());

class MisPedidosScreen extends StatelessWidget {
  const MisPedidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Pedidos pedidosProvider = Provider.of<Pedidos>(context, listen: false);
    Estados estadosProvider = Provider.of<Estados>(context, listen: false);
    Auth usuarioProvider = Provider.of<Auth>(context, listen: false);
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            const Fondo(),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const BarraRetorno(
                  text: 'Mis Pedidos',
                  widget_viaje: MenuScreen(),
                  tamLetra: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                const BarraBusqueda(),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pedidosProvider.items.length,
                    itemBuilder: (context, index) {
                      Pedido pedido = pedidosProvider.items[index];
                      if (pedido.codigoUsuario != usuarioProvider.codigoUsuario) {
                        return Container(); // Devolver un contenedor vacío para usuarios bloqueados
                      }
                      return Column(
                        children: [
                          BarraLateralButton(
                            text: pedido.precioTotal.toString(),
                            screen: const MisPedidosScreen(),
                            topLeftText: "${pedido.fecha.year.toString().padLeft(4, '0')}-${pedido.fecha.month.toString().padLeft(2, '0')}-${pedido.fecha.day.toString().padLeft(2, '0')}",
                            topRightText: (estadosProvider.list[pedido.codEstEnt].descripcion).toString(),
                            bottomLeftText: pedido.codPedCab.toString(),
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: const BarraNavegacion(),
      ),
    );
  }
}

class BarraLateralButton extends StatelessWidget {
  final String text;
  final Widget screen;
  final String topLeftText;
  final String topRightText;
  final String bottomLeftText;

  const BarraLateralButton({
    Key? key,
    required this.text,
    required this.screen,
    required this.topLeftText,
    required this.topRightText,
    required this.bottomLeftText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0x00EAD0F6), Color(0xFFEAD0F6)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: Text(
                                  topLeftText,
                                  style: const TextStyle(
                                    color: Color(0xFF5C4F5F),
                                    fontSize: 25,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w800,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 7, left: 0),
                                child: Text(
                                  'S./ $text',
                                  style: const TextStyle(
                                    color: Color(0xFF5C4F5F),
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                topRightText,
                                style: const TextStyle(
                                  color: Color(0xFFAC37BF),
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '#$bottomLeftText',
                                style: const TextStyle(
                                  color: Color(0xFF5C4F5F),
                                  fontSize: 23,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(children: [
                      Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => screen,
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: const Color(0xFF471AA0),
                          iconSize: 15,
                        ),
                      ),
                    ])
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
