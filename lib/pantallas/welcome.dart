import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/categorias.dart';
import 'package:medic_app/pantallas/components/barra_busqueda.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';
import 'package:medic_app/pantallas/login.dart';
import 'package:medic_app/pantallas/menu.dart';

void main() => runApp(const WelcomeScreen());

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Fondo con degradado
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [
                Color.fromARGB(255, 228, 222, 229),
                Color.fromARGB(255, 215, 120, 230),
                Color.fromARGB(255, 182, 75, 198),
                Color(0xFFC143D6),
                Color.fromARGB(255, 129, 18, 146)
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // BARRA DE BUSQUEDA CON BOTON DE MENU
              Padding(
                // Padding del buscador
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Boton menu
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MenuScreen(),
                            ),
                          );
                        },
                        child: Image.asset('assets/vector.png')),

                    // Buscador
                    const BarraBusqueda(),
                  ],
                ),
              ),

              const SizedBox(height: 45),

              // LOGO APP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  Image.asset(
                    'assets/logoApp.png',
                    height: 200,
                  )
                ],
              ),

              const SizedBox(height: 30),

              // TEXTO BUENOS DÍAS
              const SizedBox(
                child: Text(
                  'Hola USUARIO, buenos días',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Lalezar',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // REALIZAR PEDIDO
              ElevatedButton(
                onPressed: () {
                  // TODO: REDIRIGIR A DIRECCION
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 255, 255), // Color de fondo del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 15.0), // Ajusta el tamaño del botón
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/ubicacion.png'),
                    const SizedBox(
                        width: 8.0), // Espacio entre el icono y el texto
                    const Text(
                      '¿Dónde quieres recbir tu pedido? ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Inter',

                        fontWeight: FontWeight.w400,
                        color:
                            Color.fromARGB(255, 50, 45, 45), // Color del texto
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // REALIZAR PEDIDO (UBICACIÓN ACTUAL)
              TextButton(
                onPressed: () {
                  // Acciones a realizar cuando se presiona el botón
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/ubiActual.png'),
                    const SizedBox(
                        width: 8.0), // Espacio entre la imagen y el texto
                    const Text(
                      'Usar ubicación actual',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // VER PRODUCTOS
              FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategorySceen(),
                      ),
                    );
                  },
                  extendedPadding: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 20,
                  label: const Text(
                    'Ver Productos',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Inter',
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 139, 46, 215),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  )
                ),
            ],
          ), 
        ),

        // BARRA DE NAVEGACIÓN
        bottomNavigationBar: const BarraNavegacion(),
      ),

    );
  }
}
