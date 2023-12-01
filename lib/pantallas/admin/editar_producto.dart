import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/admin/editar_producto_buscar.dart';
import 'package:provider/provider.dart';
import '../../models/categoria.dart';
import '../../models/producto.dart';
import '../../providers/categorias.dart';
import '../../providers/productos.dart';

import '../components/barra_navegacion.dart';
import 'package:image_picker/image_picker.dart';

import '../components/field_producto_update_admin.dart';

class EditarProductoScreen extends StatefulWidget {
  final int codigoProducto;

  const EditarProductoScreen({Key? key, required this.codigoProducto})
      : super(key: key);

  @override
  EditarProductoScreenState createState() => EditarProductoScreenState();
}

class EditarProductoScreenState extends State<EditarProductoScreen> {
  late int _codigoProducto;
  late TextEditingController _nombreController;
  late TextEditingController _marcaController;
  late TextEditingController _descripcionController;
  late TextEditingController _precioController;
  late TextEditingController _cantidadController;
  late int _codigoCategoria;
  late String _imagePath;

  @override
  void initState() {
    super.initState();

    // Obtener el producto con el código proporcionado
    final producto = Provider.of<Productos>(context, listen: false)
        .list
        .firstWhere((p) => p.codigoProducto == widget.codigoProducto);

    // Inicializar controladores con los datos del producto
    _codigoProducto = producto.codigoProducto;
    _nombreController = TextEditingController(text: producto.nombreProducto);
    _marcaController = TextEditingController(text: producto.marca);
    _descripcionController = TextEditingController(text: producto.descripcion);
    _precioController = TextEditingController(text: producto.precio.toString());
    _codigoCategoria = producto.codigoCategoria;
    _cantidadController =
        TextEditingController(text: producto.cantidadStock.toString());
    _imagePath = producto.imagen;
  }

  @override
  void dispose() {
    // Dispose de los controladores
    _nombreController.dispose();
    _marcaController.dispose();
    // ... Dispose de otros controladores
    super.dispose();
  }

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
          child: Column(
            children: [
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
              Row(
                children: [
                  ReusableRow(
                    labelText: 'Nombre',
                    controller: _nombreController, highText: '',
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  ReusableRow(
                    labelText: 'Marca',
                    controller: _marcaController, highText: '',
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  ReusableRow(
                    labelText: 'Descripcion',
                    controller: _descripcionController, highText: '',
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  ReusableRow(
                    labelText: 'Precio',
                    controller: _precioController, highText: '',
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    const Text(
                      'Categoría',
                      style: TextStyle(
                        color: Color.fromARGB(255, 56, 20, 126),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Consumer<Categorias>(
                      builder: (context, categoriasProvider, _) {
                        return DropdownButton<int>(
                          value: _codigoCategoria,
                          onChanged: (newValue) {
                            setState(() {
                              _codigoCategoria = newValue!;
                            });
                          },
                          items: categoriasProvider.list
                              .map((Categoria categoria) {
                            return DropdownMenuItem<int>(
                              value: categoria.codigoCategoria,
                              child: Text(categoria.descripcion),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  ReusableRow(
                    labelText: 'Cantidad',
                    controller: _cantidadController, highText: '',
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
                    child: _imagePath
                            .startsWith("images") // Verificar si es una URL
                        ? Image.network(
                            "http://ivelitaunsa201920210.c1.is/api_medicapp/product/$_imagePath",
                            width: 57,
                            height: 57,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(_imagePath),
                            width: 57,
                            height: 57,
                            fit: BoxFit.cover,
                          )),
              ),
              SizedBox(height: size.height * 0.03),
              FloatingActionButton.extended(
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
                ),
                onPressed: () {
                  // Acceder al valor actualizado desde los controladores
                  final nuevoNombre = _nombreController.text;
                  final nuevaMarca = _marcaController.text;
                  final nuevaDescripcion = _descripcionController.text;
                  final nuevoPrecio = _precioController.text;
                  final nuevaCategoria = _codigoCategoria;
                  final nuevaCantidad = _cantidadController.text;

                  try {
                    Map<String, dynamic> parametros = {
                      'codigoProducto': _codigoProducto,
                      'nombreProducto': nuevoNombre,
                      'marca': nuevaMarca,
                      'descripcion': nuevaDescripcion,
                      'precio': double.parse(nuevoPrecio),
                      'codigoCategoria': nuevaCategoria,
                      'cantidadStock': int.parse(nuevaCantidad),
                      'imagen': ''
                    };
                    Provider.of<Productos>(context, listen: false)
                        .updateProducto(
                            Producto.fromJson(parametros), _imagePath);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EditarProductoBuscarScreen()));
                  } catch (error) {
                    rethrow;
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BarraNavegacion(),
      ),
    );
  }
}
