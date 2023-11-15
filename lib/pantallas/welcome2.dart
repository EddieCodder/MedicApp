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

              Container(
                width: 355,
                height: 65,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ) 
                
              )

              // BOTON DE REALIZAR PEDIDO 
              /*FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );               
                },

                label: Text(
                  '¿Dónde quieres recibir tu pedido?',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6000000238418579),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,                    
                  ),
                ),
                
                extendedPadding:const EdgeInsets.symmetric(horizontal:50),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), 
                )
              ),*/


            ],
            
          ),
        ), 
      ),
    
    );
  }
}



