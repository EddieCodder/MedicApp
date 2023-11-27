import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic_app/pantallas/login.dart';
import '../components/barra_navegacion.dart';

class EditarProductoImgScreen extends StatefulWidget {
  const EditarProductoImgScreen({super.key});

  @override
  State<EditarProductoImgScreen> createState() =>
      _EditarProductoImgScreenState();
}

class _EditarProductoImgScreenState extends State<EditarProductoImgScreen> {
  String? _imagePath =
      "https://www.hogarysalud.com.pe/wp-content/uploads/2021/04/00199811-C1.jpg";
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
              SizedBox(height: size.height * 0.01),
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
                      color: Color.fromARGB(255, 45, 16, 102),
                      fontSize: 23,
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
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      'Cambiar Imagen',
                      style: TextStyle(
                        color: Color(0xFF5C4F5F),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.03),
              InkWell(
                onTap: _getImage,
                child: Container(
                  width: 207,
                  height: 207,
                  decoration: ShapeDecoration(
                    color: const Color(0x00D9D9D9),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: _imagePath != null
                      ? Image.network(
                          _imagePath!,
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
              FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
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
