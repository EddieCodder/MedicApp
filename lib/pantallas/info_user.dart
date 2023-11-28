// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/admin/editar_producto.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';
import 'package:medic_app/pantallas/components/boton_guardar.dart';
import 'package:medic_app/pantallas/components/foto_perfil.dart';
import 'package:medic_app/pantallas/fondo.dart';
import 'package:medic_app/pantallas/menu.dart';

void main() => runApp(const UserScreen());

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      home: Scaffold(
        extendBodyBehindAppBar: true, // ELIMINAR FONDO DE LA BARRA
        appBar: const BarraRetorno(text: 'Información de la cuenta', widget_viaje: MenuScreen(),),
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
                      const Text(
                        'NOMBRE NOMBRE2 APELLIDO',
                        style: TextStyle(
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
              const ReusableRow(
                labelText: 'Nombre(s)',
                highText: 'NOMBRE NOMBRE2|',
              ),

              const SizedBox(
                height: 30,
              ),
              const ReusableRow(
                labelText: 'Apellido(s)',
                highText: 'APELLIDO|',
              ),

              const SizedBox(
                height: 30,
              ),
              const ReusableRow(
                labelText: 'Correo Electrónico',
                highText: 'correo@gmail.com',
              ),

              const SizedBox(
                height: 30,
              ),
              const ReusableRow(
                labelText: 'Fecha Nacimiento',
                highText: '10/10/2000',
              ),

              const SizedBox(
                height: 30,
              ),
              const ReusableRow(
                labelText: 'Género',
                highText: 'Hombre/Mujer/Otro',
              ),

              const SizedBox(
                height: 40,
              ),

              const BotonGuardado(
                text: 'Guardar',
              )
            ],
          )
        ]),
        bottomNavigationBar: const BarraNavegacion(),
      ),
    );
  }
}
