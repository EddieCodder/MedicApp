import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic_app/pantallas/components/app_bar_con_logo_izq.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/components/boton_guardar.dart';
import 'package:medic_app/pantallas/direccion.dart';
import 'package:medic_app/pantallas/tipo_pedido.dart';

void main() => runApp(const CompraRecetaScreen());

class CompraRecetaScreen extends StatefulWidget {
  const CompraRecetaScreen({super.key});

  @override
  State<CompraRecetaScreen> createState() => _CompraRecetaScreenState();
}

class _CompraRecetaScreenState extends State<CompraRecetaScreen> {
  String? _imagePath;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const AppBarLogoIzquierda(
          showX: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const BarraRetorno(
                text: 'Regresar',
                widget_viaje: SelecPedidoScreen(),
                tamLetra: 24,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Con Receta',
                style: TextStyle(
                  color: Color(0xFF471AA0),
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Cargar imagen',
                style: TextStyle(
                  color: Color(0xFF471AA0),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 50 * 0.03),
              InkWell(
                onTap: () => _getImage(ImageSource.gallery),
                child: Container(
                  width: 254,
                  height: 254,
                  decoration: ShapeDecoration(
                    color: const Color(0x00D9D9D9),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: _imagePath != null
                      ? Image.file(
                          File(_imagePath!),
                          fit: BoxFit.cover,
                        )
                      : Image.asset('assets/insertarImagen.png'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: 249,
                height: 126,
                child: Text(
                  'Adjunte la imagen de su receta médica para hacer el pedido',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF5C4F5F),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Text(
                'Tome una foto',
                style: TextStyle(
                  color: Color(0xFF471AA0),
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              InkWell(
                onTap: _takePhoto,
                child: Image.asset('assets/camara.png'),
              ),
              const SizedBox(
                height: 30,
              ),
              BotonBasic(
                text: 'Continuar',
                pantalla: DireccionScreen(
                    ingresoDesdeBienvenida: false, imagePath: _imagePath),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
