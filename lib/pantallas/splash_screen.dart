import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Agrega un temporizador para cerrar el SplashScreen después de 3 segundos
    Timer(
      const Duration(seconds: 3),
      () {
        // Verificar si el widget está montado antes de realizar la navegación
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
