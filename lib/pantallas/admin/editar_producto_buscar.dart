import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/admin/editar_producto.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';

import 'package:medic_app/pantallas/components/barra_navegacion.dart';
import 'package:provider/provider.dart';
import '../../providers/productos.dart';

import '../components/barra_busqueda.dart';
import './opciones_admin.dart';

class EditarProductoBuscarScreen extends StatelessWidget {
  const EditarProductoBuscarScreen({super.key});

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
                SizedBox(height: size.height * 0.01),
                const BarraRetorno(
                  text: 'Regresar',
                  widget_viaje: OpcionesAdmin(),
                  tamLetra: 20,
                ),
                const BarraBusqueda(),
                SizedBox(height: size.height * 0.03),
                const Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      'Categorías',
                      style: TextStyle(
                        color: Color.fromARGB(255, 56, 20, 126),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  )
                ]),
                SizedBox(height: size.height * 0.025),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            width: 130,
                            height: 45,
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
                                  'Aseo Personal',
                                  style: TextStyle(
                                    color: Color(0xFF5C4F5F),
                                    fontSize: 17,
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
                          width: 135,
                          height: 45,
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
                                'Medicamentos',
                                style: TextStyle(
                                  color: Color(0xFF5C4F5F),
                                  fontSize: 17,
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
                          width: 130,
                          height: 45,
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
                                'Aseo Personal',
                                style: TextStyle(
                                  color: Color(0xFF5C4F5F),
                                  fontSize: 17,
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
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            width: 130,
                            height: 45,
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
                                  'Productos\nmaternos',
                                  style: TextStyle(
                                    color: Color(0xFF5C4F5F),
                                    fontSize: 17,
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
                          width: 130,
                          height: 45,
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
                                'Belleza',
                                style: TextStyle(
                                  color: Color(0xFF5C4F5F),
                                  fontSize: 17,
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
                          width: 130,
                          height: 45,
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
                                'Nutrición',
                                style: TextStyle(
                                  color: Color(0xFF5C4F5F),
                                  fontSize: 17,
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
                SizedBox(height: size.height * 0.03),
                const Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      'Productos',
                      style: TextStyle(
                        color: Color.fromARGB(255, 56, 20, 126),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  )
                ]),
                SizedBox(height: size.height * 0.018),
                Expanded(
                  child: ListView.builder(
                    itemCount: Provider.of<Productos>(context).list.length,
                    itemBuilder: (context, index) {
                      final producto =
                          Provider.of<Productos>(context).list[index];

                      return CustomContainer(
                        codigoProducto: producto.codigoProducto,
                        leftText: producto.nombreProducto,
                        rightText: producto.cantidadStock.toString(),
                        onDelete: () {
                          Provider.of<Productos>(context, listen: false)
                              .deleteProducto(producto.codigoProducto);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EditarProductoBuscarScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ])),
          bottomNavigationBar: const BarraNavegacion(),
        ));
  }
}

class CustomContainer extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback onDelete;
  final int codigoProducto;

  const CustomContainer({
    Key? key,
    required this.leftText,
    required this.rightText,
    required this.onDelete,
    required this.codigoProducto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                EditarProductoScreen(codigoProducto: codigoProducto),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 351,
              height: 45,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      leftText,
                      style: const TextStyle(
                        color: Color(0xFF5C4F5F),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(9, 13, 10, 0),
                    child: Text(
                      rightText,
                      style: const TextStyle(
                        color: Color(0xFF5C4F5F),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onDelete,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.transparent,
                      child: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
