import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug
      title: 'Material de Inicio',
      routes: {
        'login': (_) =>  LoginScreen(),
      },
      initialRoute: 'login',

    );
  }
}