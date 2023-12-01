import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/detalles_producto.dart';
import 'package:medic_app/pantallas/login.dart';
import 'package:medic_app/pantallas/mis_pedidos.dart';
import 'package:medic_app/pantallas/splash_screen.dart';
import 'package:medic_app/pantallas/welcome.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import 'providers/productos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeScreen();
    /*return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider<Productos>(
          create: (ctx) => Productos(),
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
    );*/
  }
}
