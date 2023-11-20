import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/admin/opciones_admin.dart';
import 'package:medic_app/pantallas/admin/pedidos_sin_receta_detalle.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';

import '../components/barra_busqueda.dart';

class PedidosSinReceta extends StatelessWidget {
  const PedidosSinReceta({super.key});

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.12),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: const Color(0xFF471AA0),
                      iconSize: 25,
                      padding: const EdgeInsets.only(left: 30),
                    ),
                    const Text(
                      'Pedidos sin Receta',
                      style: TextStyle(
                        color: Color.fromARGB(255, 33, 11, 75),
                        fontSize: 30,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const BarraBusqueda(),
                SizedBox(height: size.height * 0.03),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Container(
                            width: 105,
                            height: 35,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF2EFF4),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pendiente',
                                  style: TextStyle(
                                    color: Color(0xFF5C4F5F),
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: size.width * 0.04),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 105,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF2EFF4),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cancelado',
                                style: TextStyle(
                                  color: Color(0xFF5C4F5F),
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: size.width * 0.04),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 105,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF2EFF4),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Entregado',
                                style: TextStyle(
                                  color: Color(0xFF5C4F5F),
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Column(children: [
                    SizedBox(height: size.height * 0.05),
                    const BarraLateralButton(
                        screen: PedidosSinRecetaDetalleScreen(),
                        topLeftText: '30/10/2023',
                        bottomLeftText: '0004',
                        text: '17.00',
                        topRightText: 'pediente'),
                    SizedBox(height: size.height * 0.02),
                    const BarraLateralButton(
                        screen: OpcionesAdmin(),
                        topLeftText: '15/10/2023',
                        bottomLeftText: '0003',
                        text: '3.50',
                        topRightText: 'entregado'),
                    SizedBox(height: size.height * 0.02),
                    const BarraLateralButton(
                        screen: OpcionesAdmin(),
                        topLeftText: '30/10/2023',
                        bottomLeftText: '0002',
                        text: '1.00',
                        topRightText: 'entregado'),
                    SizedBox(height: size.height * 0.02),
                    const BarraLateralButton(
                        screen: OpcionesAdmin(),
                        topLeftText: '30/10/2023',
                        bottomLeftText: '0001',
                        text: '7.00',
                        topRightText: 'entregado'),
                    SizedBox(height: size.height * 0.02),
                    const Padding(
                      padding: EdgeInsets.only(left: 80),
                      child: Row(
                        children: [
                          Center(
                            child: Text(
                              'No hay más pedidos',
                              style: TextStyle(
                                color: Color.fromARGB(255, 144, 143, 143),
                                fontSize: 25,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                )
              ])),
          bottomNavigationBar: const BarraNavegacion(),
        ));
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
                    Column(children: [
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
