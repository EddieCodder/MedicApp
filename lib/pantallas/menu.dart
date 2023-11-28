import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/admin/opciones_admin.dart';
import 'package:medic_app/pantallas/components/app_bar_con_logo_izq.dart';
import 'package:medic_app/pantallas/components/boton_seleccion.dart';
import 'package:medic_app/pantallas/components/foto_perfil.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

void main() => runApp(const MenuScreen());

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      title: 'Material App',
      home: Scaffold(
        extendBodyBehindAppBar: true, // ELIMINAR FONDO DE LA BARRA

        appBar: const AppBarLogoIzquierda(
            showX: true), // Barra con Logo a la Izquierda con (X)
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // -------------------------------------------------------------------------
            // FOTO DE PERFIL
            const FotoPerfil(tam: 125),

            // -------------------------------------------------------------------------
            // SALUDO
            const Text(
              'Hola USUARIO',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF5C4F5F),
                fontSize: 24,
                fontFamily: 'Lalezar',
                fontWeight: FontWeight.w400,
                height: 2,
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // -------------------------------------------------------------------------
            // BOTÓN SELECCIÓN: REALIZAR PEDIDO
            BotonSeleccion(
              texto: 'Realizar Pedido',
            ),
            const SizedBox(
              height: 20,
            ),

            // -------------------------------------------------------------------------
            // BOTÓN SELECCIÓN: MIS PEDIDOS
            BotonSeleccion(
              texto: 'Mis pedidos',
            ),
            const SizedBox(
              height: 20,
            ),

            // -------------------------------------------------------------------------
            // BOTÓN SELECCIÓN: INFORMACION DE LA CUENTA
            BotonSeleccion(
              texto: 'Información de la cuenta',
            ),
            const SizedBox(
              height: 20,
            ),

            // -------------------------------------------------------------------------
            // BOTÓN SELECCIÓN: CONTACTANOS
            BotonSeleccion(
              texto: 'Contáctanos',
            ),
            const SizedBox(
              height: 20,
            ),

            // -------------------------------------------------------------------------
            // BOTÓN SELECCIÓN: AYUDA
            BotonSeleccion(
              texto: 'Ayuda',
            ),
            const SizedBox(
              height: 20,
            ),

            // -------------------------------------------------------------------------
            // BOTÓN SELECCIÓN: CERRAR SESIÓN
            BotonSeleccion(
              texto: 'Cerrar Sesión',
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        )),

        bottomSheet: Consumer<Auth>(
          builder: (context, auth, child) {
            if (auth.esAdmin == 1) {
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OpcionesAdmin(),
                    ),
                  );
                },
                child: Text(
                  'Opciones de Administrador',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6000000238418579),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink(); // Devuelve un contenedor vacío si no es admin
            }
          },
        ),

        // ---------------------------------------------------------------------
      ),
    );
  }
}


