// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/barra_navegacion.dart';
import '../components/producto_fields.dart';
import 'dart:io';

class AgregarProductoScreen extends StatelessWidget {
  AgregarProductoScreen({super.key});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController categoriaController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();

  String? _imagePath;
  Future<void> _getImage() async {
    /*final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }*/
    //TODO: Implementar el _getImage para usar la galeria del usuario
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
              Row(
                children: [
                  ReusableRow(
                      labelText: 'Nombre', controller: nombreController),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  ReusableRow(labelText: 'Marca', controller: marcaController),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(children: [
                ReusableRow(
                  labelText: 'Descripcion',
                  controller: descripcionController,
                )
              ]),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  ReusableRow(
                      labelText: 'Precio', controller: precioController),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  ReusableRow(
                      labelText: 'Categoría', controller: categoriaController),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              InkWell(
                onTap: _getImage,
                child: Container(
                  width: 107,
                  height: 107,
                  decoration: ShapeDecoration(
                    color: const Color(0x00D9D9D9),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: _imagePath != null
                      ? Image.file(
                          // Muestra la imagen seleccionada
                          File(_imagePath!),
                          width: 207,
                          height: 207,
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
                    //TODO: Funcionalidad del guardado
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
