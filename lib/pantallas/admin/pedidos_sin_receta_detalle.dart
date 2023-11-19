// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/barraNavegacion.dart';

import '../components/barraBusqueda.dart';

class PedidosSinRecetaDetalleScreen extends StatelessWidget {
  const PedidosSinRecetaDetalleScreen({super.key});

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
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '30/10/2023',
                                style: TextStyle(
                                  color: Color(0xFF5C4F5F),
                                  fontSize: 30,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 130),
                            child: Column(
                              children: [
                                Text(
                                  '#0004',
                                  style: TextStyle(
                                    color: Color(0xFF5C4F5F),
                                    fontSize: 30,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ])
                  ],
                ),
                const BarraBusqueda(),
                SizedBox(height: size.height * 0.03),
                Row(children: [
                  SizedBox(width: size.width * 0.10),
                  DropdownButton<String>(
                    value: 'Pendiente',
                    onChanged: (String? newValue) {
                      // TODO: Puedes manejar la selección aquí
                    },
                    items: <String>['Pendiente', 'Entregado', 'Enviando']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFAC37BF),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              height: 0,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Column(children: [
                    SizedBox(height: size.height * 0.02),
                    const BarraLateralButton(
                      topLeftText: 'Amoxicilina',
                      bottomLeftText: '4.00',
                    ),
                    SizedBox(height: size.height * 0.02),
                  ]),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      Center(
                        child: Text(
                          'No hay más productos',
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
              ])),
          bottomNavigationBar: const BarraNavegacion(),
        ));
  }
}

class BarraLateralButton extends StatefulWidget {
  final String topLeftText;
  final String bottomLeftText;

  const BarraLateralButton({
    Key? key,
    required this.topLeftText,
    required this.bottomLeftText,
  }) : super(key: key);

  @override
  _BarraLateralButtonState createState() => _BarraLateralButtonState();
}

class _BarraLateralButtonState extends State<BarraLateralButton> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
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
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        widget.topLeftText,
                        style: const TextStyle(
                          color: Color(0xFF5C4F5F),
                          fontSize: 25,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7, left: 0),
                      child: Text(
                        'S/. ${widget.bottomLeftText} por Unidad',
                        style: const TextStyle(
                          color: Color(0xFF5C4F5F),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              if (isExpanded)
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '5 Unidades', // Texto de unidades
                        style: TextStyle(
                          color: Color(0xFFAC37BF),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'S/. 20 Soles',
                        style: TextStyle(
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
        ),
      ),
    );
  }
}
