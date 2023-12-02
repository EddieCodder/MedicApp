// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic_app/pantallas/admin/opciones_admin.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import '../components/barra_navegacion.dart';
import '../components/producto_fields.dart';
import 'package:provider/provider.dart';
import '../../providers/productos.dart';
import '../../models/producto.dart';
import 'dart:io';

class AgregarProductoScreen extends StatefulWidget {
  const AgregarProductoScreen({Key? key}) : super(key: key);

  @override
  AgregarProductoScreenState createState() => AgregarProductoScreenState();
}

class AgregarProductoScreenState extends State<AgregarProductoScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController categoriaController = TextEditingController();
  final TextEditingController cantidadStockController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();

  String? _imagePath;
  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
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
              const BarraRetorno(
                text: 'Mis Pedidos',
                widget_viaje: OpcionesAdmin(),
                tamLetra: 30,
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
                    try {
                      Map<String, dynamic> parametros = {
                        'codigoProducto': 0,
                        'nombreProducto': nombreController.text,
                        'marca': marcaController.text,
                        'descripcion': descripcionController.text,
                        'precio': double.parse(
                          precioController.text,
                        ),
                        'codigoCategoria': int.parse(categoriaController.text),
                        'cantidadStock': 100,
                        'imagen': ''
                      };
                      Provider.of<Productos>(context, listen: false)
                          .addProducto(
                              Producto.fromJson(parametros), _imagePath ?? '');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OpcionesAdmin()));
                    } catch (error) {
                      rethrow;
                    }
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
