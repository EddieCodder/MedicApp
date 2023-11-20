import 'package:flutter/material.dart';
import '../components/barraNavegacion.dart';

class AgregarProductoScreen extends StatelessWidget {
  const AgregarProductoScreen({super.key});
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
                    'Regresar',
                    style: TextStyle(
                      color: Color.fromARGB(255, 56, 20, 126),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    'AGREGAR PRODUCTO',
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
              SizedBox(height: size.height * 0.03),
              const Row(
                children: [
                  ReusableRow(labelText: 'Nombre'),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              const Row(
                children: [
                  ReusableRow(labelText: 'Marca'),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: 430,
                      height: 200,
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Descripcion',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.32),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.3),
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '|',
                                      hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              const Row(
                children: [
                  ReusableRow(labelText: 'Precio'),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              const Row(
                children: [
                  ReusableRow(labelText: 'Categoría'),
                ],
              ),
              SizedBox(height: size.height * 0.03),
            ])),
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  //TODO: Implementar la logica de subida de Datos Post
                },
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF471AA0),
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BarraNavegacion(),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String labelText;

  const ReusableRow({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 430,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    labelText,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.32),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: '|',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
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
