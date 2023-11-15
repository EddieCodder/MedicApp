import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/barraBusqueda.dart';
import 'package:medic_app/pantallas/login.dart';

void main() => runApp(const WelcomeScreen2());

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        // Fondo con degradado
        backgroundColor: Colors.transparent, // Establece el color de fondo del Scaffold a transparente
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient (
              begin: Alignment(0.00, -1.00), 
              end: Alignment(0, 1),
              colors: [
                Color.fromARGB(255, 228, 222, 229),
                Color.fromARGB(255, 215, 120, 230), 
                Color.fromARGB(255, 182, 75, 198), 
                Color(0xFFC143D6), 
                Color.fromARGB(255, 129, 18, 146)],
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
                              builder: (context) => const LoginScreen(), 
                            ),
                          );                                      
                        }, 
                        child: Image.asset('assets/vector.png')
                      ),

                    // Buscador
                    const BarraBusqueda(),
                  ],
                ),
              ),


              const SizedBox(height: 100),

              // Logo App
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
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Color de fondo del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0), // Ajusta el tamaño del botón

                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/ubicacion.png'),
                    const SizedBox(width: 8.0), // Espacio entre el icono y el texto
                    
                    const Text(
                      '¿Dónde quieres recbir tu pedido?',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Inter',

                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 50, 45, 45), // Color del texto
              
                       ),
                    )
                  ],
                ),
              )



            ],
            
          ),
        ), 
      ),
    
    );
  }
}



