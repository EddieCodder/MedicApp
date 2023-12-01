// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';
import 'package:medic_app/pantallas/components/field_producto_update_admin.dart';
import 'package:medic_app/pantallas/components/foto_perfil.dart';
import 'package:medic_app/pantallas/menu.dart';
import 'package:provider/provider.dart';

import '../models/usuario.dart';
import '../providers/auth.dart';

void main() => runApp(const UserScreen());

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {
  late TextEditingController _nombreController;
  late TextEditingController _appelidoController;
  late TextEditingController _correoController;
  late TextEditingController _fecNacController;
  late TextEditingController _genController;

  @override
  Widget build(BuildContext context) {
    final usuariosProvider = Provider.of<Auth>(context, listen: false);
    final usuario = usuariosProvider.list.firstWhere(
        (user) => user.codigoUsuario == usuariosProvider.codigoUsuario);

    _nombreController = TextEditingController(text: usuario.nombre);
    _appelidoController = TextEditingController(text: usuario.apellido);
    _correoController = TextEditingController(text: usuario.correo);
    _fecNacController = TextEditingController(
        text:
            "${usuario.fechaNacimiento.year.toString().padLeft(4, '0')}-${usuario.fechaNacimiento.month.toString().padLeft(2, '0')}-${usuario.fechaNacimiento.day.toString().padLeft(2, '0')}");
    _genController = TextEditingController(text: usuario.genero);

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      home: Scaffold(
        extendBodyBehindAppBar: true, // ELIMINAR FONDO DE LA BARRA
        appBar: const BarraRetorno(
          text: 'Información de la cuenta',
          widget_viaje: MenuScreen(), tamLetra: 24,
        ),
        body: Stack(children: [
          //const Fondo(),
          Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const FotoPerfil(
                    tam: 80,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mi perfil (ADMIN)',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3199999928474426),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${usuario.nombre} ${usuario.apellido}',
                        style: const TextStyle(
                          color: Color(0xFF5C4F5F),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              // CAMPOS DE TEXTO

              const SizedBox(
                height: 50,
              ),
              ReusableRow(
                labelText: 'Nombre(s)',
                controller: _nombreController,
                highText: '',
              ),

              const SizedBox(
                height: 30,
              ),
              ReusableRow(
                labelText: 'Apellido(s)',
                controller: _appelidoController,
                highText: '',
              ),

              const SizedBox(
                height: 30,
              ),
              ReusableRow(
                labelText: 'Correo Electrónico',
                controller: _correoController,
                highText: '',
              ),

              const SizedBox(
                height: 30,
              ),
              ReusableRow(
                labelText: 'Fecha Nacimiento',
                controller: _fecNacController,
                highText: '',
              ),

              const SizedBox(
                height: 30,
              ),
              ReusableRow(
                labelText: 'Género(H, M, O(Otro))',
                controller: _genController,
                highText: '',
              ),

              const SizedBox(
                height: 40,
              ),

              FloatingActionButton.extended(
                label: const Text(
                  'Guardar',
                  style: TextStyle(
                    fontSize: 18,
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
                  final nuevoApellido = _appelidoController.text;
                  final nuevoCorreo = _correoController.text;
                  final nuevaFecha = _fecNacController.text;
                  final nuevoGenero = _genController.text;
                  try {
                    Map<String, dynamic> parametros = {
                      'codigoUsuario': usuario.codigoUsuario,
                      'nombreUsuario': "",
                      'correo': nuevoCorreo,
                      'contrasena': "",
                      'nombre': nuevoNombre,
                      'apellido': nuevoApellido,
                      'telefono': usuario.telefono,
                      'direccion': usuario.direccion,
                      'fechaNacimiento': nuevaFecha,
                      'genero': nuevoGenero,
                      'esAdmin': usuario.esAdmin,
                      'esBloqueado': usuario.esBloqueado,
                      'esAutenticado': usuario.esAutenticado,
                    };
                    Provider.of<Auth>(context, listen: false)
                        .updateUsuario(Usuario.fromJson(parametros));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuScreen()));
                  } catch (error) {
                    rethrow;
                  }
                },
              ),
            ],
          )
        ]),
        bottomNavigationBar: const BarraNavegacion(),
      ),
    );
  }
}
