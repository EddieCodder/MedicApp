import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/admin/editar_producto_img.dart';
import '../components/barra_navegacion.dart';

class EditarProductoScreen extends StatelessWidget {
  const EditarProductoScreen({super.key});
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
                    'EDITAR PRODUCTO',
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
                  ReusableRow(
                    labelText: 'Nombre',
                    highText: 'Amoxilcilina',
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              const Row(
                children: [
                  ReusableRow(
                    labelText: 'Marca',
                    highText: 'Nartugen',
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: 430,
                      height: 150,
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
                  ReusableRow(
                    labelText: 'Precio',
                    highText: 'S/. 4.00',
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              const Row(
                children: [
                  ReusableRow(
                    labelText: 'Categoría',
                    highText: 'Antibacteriano',
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              const Row(
                children: [
                  ReusableRow(
                    labelText: 'Cantidad',
                    highText: '1280',
                  ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditarProductoImgScreen(),
                    ),
                  );
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

class ReusableRow extends StatefulWidget {
  final String labelText;
  final String highText;

  const ReusableRow({Key? key, required this.labelText, required this.highText})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReusableRowState createState() => _ReusableRowState();
}

class _ReusableRowState extends State<ReusableRow> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.highText);
  }

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
                    widget.labelText,
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
                      controller: _textEditingController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: widget.highText,
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 11, 0, 0),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {},
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

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
