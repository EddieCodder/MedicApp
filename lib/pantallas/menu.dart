import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_con_logo_izq.dart';
import 'package:medic_app/pantallas/components/boton_seleccion.dart';
import 'package:medic_app/pantallas/login.dart';

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
            const FotoPerfil(),

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

        bottomSheet: TextButton(
            onPressed: () {},
            child: Text(
              'Opciones de Administrador',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6000000238418579),
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )),

        // ---------------------------------------------------------------------
      ),
    );
  }
}

class FotoPerfil extends StatelessWidget {
  const FotoPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.0,
      height: 125.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFD9D9D9),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const Center(
            child: Text(
              'U',
              style: TextStyle(
                color: Color(0xFF685252),
                fontSize: 100,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Icon(
                Icons.edit,
                color: Color.fromARGB(255, 0, 0,
                    0), // Cambia el color del lápiz según tus preferencias
              ),
            ),
          ),
        ],
      ),
    );
  }
}