import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/login.dart';
import 'package:medic_app/pantallas/splash_screen.dart';
import 'package:medic_app/pantallas/welcome.dart';
import 'package:medic_app/providers/categorias.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import 'providers/carritos.dart';
import 'providers/estados.dart';
import 'providers/pedidos.dart';
import 'providers/productos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider<Productos>(
          create: (ctx) => Productos(),
        ),
        ChangeNotifierProvider<Categorias>(
          create: (ctx) => Categorias(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider<Pedidos>(
          create: (ctx) => Pedidos(),
        ),
        ChangeNotifierProvider<Estados>(
          create: (ctx) => Estados(),
        ),
      ],
      child: Consumer<Auth>(builder: (ctx, authData, child) {
        // print(authData.isAuth);
        // Llamamos a autoLogin solo una vez y almacenamos el resultado
        final Future<bool> autoLoginResult = authData.autoLogin();

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material de Inicio',
          home: FutureBuilder(
            future: autoLoginResult,
            builder: (c, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SplashScreen(); // Muestra un SplashScreen mientras se realiza la autenticación automática
              } else {
                return authData.isAuth ? LoginScreen() : const WelcomeScreen();
              }
            },
          ),
          routes: {
            'login': (_) => LoginScreen(),
          },
          // initialRoute: 'login',
        );
      }),
    );
  }
}
