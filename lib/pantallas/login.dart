import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/register.dart';
import 'package:medic_app/pantallas/welcome.dart';
import 'components/autenticate_fields.dart';

import '../providers/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _nombreUsuarioController =
      TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // Tamaño de la pantalla del celular

    return Scaffold(
      body: Container(
        width: double.infinity, // Desde el principio de la pantalla
        height: double.infinity, // Desde el principio de la pantalla
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          // Conjunto de widgets
          children: [
            // Espacio
            const SizedBox(
              height: 150,
            ),

            // Icono Persona - Logo de la App
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, // Organiza de manera uniforme a los iconos
              children: [
                // Logo de la persona
                Image.asset(
                  'assets/logoPersona.png',
                ),

                // Logo de la app
                Image.asset(
                  'assets/logoApp.png',
                  height: 150,
                ),
              ],
            ),

            // Espacio
            SizedBox(height: size.height * 0.02),

            // Texto iniciar Sesión
            Padding(
              padding: EdgeInsets.all(size.width * 0.1),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          color: Color(0xFF471AA0),
                          fontSize: 30,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  // Campo de texto Usuario
                  SizedBox(height: size.height * 0.02),

                  TextFieldRegister(
                    iconLeft: const Icon(null),
                    iconRight: const Icon(null),
                    hintText: 'Nombre de Usuario o Correo',
                    esOculto: false,
                    controller: _nombreUsuarioController,
                  ),

                  // Campo de texto Usuario
                  SizedBox(height: size.height * 0.02),
                  TextFieldRegister(
                    iconLeft: const Icon(null),
                    iconRight: const Icon(Icons.remove_red_eye_outlined),
                    hintText: 'Contraseña',
                    esOculto: true,
                    controller: _contrasenaController,
                  ),

                  // Boton textual olvidaste contraseñas
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        onPressed: () {
                          // TODO: Realizar recuperacion de cuenta
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Olvidaste tu contraseña',
                          style: TextStyle(
                              color: Color(0xFF471AA0),
                              fontWeight: FontWeight.bold),
                        )),
                  ]),

                  SizedBox(height: size.height * 0.02),

                  FloatingActionButton.extended(
                      onPressed: () {
                        final nombreUsuario = _nombreUsuarioController.text;
                        final contrasena = _contrasenaController.text;
                        // Verifica si el valor contiene '@' para determinar si es un correo electrónico
                        bool esCorreo = nombreUsuario.contains('@');
                        if (esCorreo) {
                          Provider.of<Auth>(context, listen: false).login(
                              correo: nombreUsuario, contrasena: contrasena);
                        } else {
                          Provider.of<Auth>(context, listen: false).login(
                              nombreUsuario: nombreUsuario,
                              contrasena: contrasena);
                        }

                        if (Provider.of<Auth>(context, listen: false).esAutenticado == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomeScreen(),
                            ),
                          );
                        }
                      },
                      label: const Text('Iniciar Sesión'),
                      extendedPadding:
                          EdgeInsets.symmetric(horizontal: size.width),
                      backgroundColor: const Color(0xFF9550CE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),

                  SizedBox(height: size.height * 0.04),
                  const Text('O ingresa con',
                      style: TextStyle(color: Color(0xFF471AA0))),

                  SizedBox(height: size.height * 0.02),

                  // Botones de Google Facebook Twitter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomeScreen(),
                              ),
                            );
                          },
                          child: Image.asset('assets/logoGoogle.png')),

                      // Facebook
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomeScreen(),
                              ),
                            );
                          },
                          child: Image.asset('assets/logoFacebook.png')),

                      // Twitter
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomeScreen(),
                              ),
                            );
                          },
                          child: Image.asset('assets/logoTwitter.png')),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No tienes una cuenta',
                          style: TextStyle(color: Color(0xFF471AA0))),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Regístrate',
                            style: TextStyle(
                                color: Color(0xFF471AA0),
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
