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
              )
            ],
            
          ),
        ), 
      ),
    
    );
  }
}



