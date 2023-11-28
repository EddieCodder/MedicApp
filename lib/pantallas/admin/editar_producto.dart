import 'package:flutter/material.dart';

import '../components/barra_navegacion.dart';

class EditarProductoScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  EditarProductoScreen({super.key});
  final String _imagePath =
      "https://www.hogarysalud.com.pe/wp-content/uploads/2021/04/00199811-C1.jpg";
  Future<void> _getImage() async {
    /* final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }*/
  }

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
              SizedBox(height: size.height * 0.001),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.02),
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
                      height: 80,
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
              InkWell(
                onTap: _getImage,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: ShapeDecoration(
                    color: const Color(0x00D9D9D9),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  // ignore: unnecessary_null_comparison
                  child: _imagePath != null
                      ? Image.network(
                          _imagePath,
                          width: 57,
                          height: 57,
                          fit: BoxFit.cover,
                        )
                      : const Center(
                          child: Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.black,
                          ),
                        ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              FloatingActionButton.extended(
                  onPressed: () {
                    //TODO: Logica de la edición
                  },
                  extendedPadding: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 20,
                  label: const Text(
                    'Guardar',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Inter',
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 139, 46, 215),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  )),
            ])),
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
