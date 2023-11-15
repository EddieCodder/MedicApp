import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/register.dart';
import 'package:medic_app/pantallas/welcome.dart';
import 'package:medic_app/pantallas/welcome2.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

                  const TextFieldRegister(
                    hintText: 'Nombre de Usuario o Correo',
                  ),
                  
                  // Campo de texto Usuario
                  SizedBox(height: size.height * 0.02),
                  const TextFieldRegister(
                    hintText: 'Contraseña',
                    iconRight: Icon(Icons.remove_red_eye_outlined),
                  ),       

                  // Boton textual olvidaste contraseñas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // TODO: Realizar recuperacion de cuenta
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                        },
                        child: const Text('Olvidaste tu contraseña', style: TextStyle(color: Color(0xFF471AA0), fontWeight: FontWeight.bold),)
                      ),
                      ]
                  ),

                  SizedBox(height: size.height * 0.02),

                  FloatingActionButton.extended(
                      onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomeApp(),
                            ),
                          );               
                      },
                      label: const Text('Iniciar Sesión'),
                      extendedPadding:EdgeInsets.symmetric(horizontal: size.width),
                      backgroundColor: const Color(0xFF9550CE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), 
                      )
                  ),

                  SizedBox(height: size.height * 0.04),
                  const Text('O ingresa con', style: TextStyle(color: Color(0xFF471AA0))),

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
                              builder: (context) => const WelcomeApp(),
                            ),
                          );             
                        }, 
                        child: Image.asset('assets/logoGoogle.png')
                      ),

                      // Facebook
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomeApp(),
                            ),
                          );                                      
                        }, 
                        child: Image.asset('assets/logoFacebook.png')
                      ),

                      // Twitter
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomeScreen2(),
                            ),
                          );             
                        }, 
                        child: Image.asset('assets/logoTwitter.png')
                      ),
                    ],

                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No tienes una cuenta', style: TextStyle(color: Color(0xFF471AA0))),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );                          
                        },
                        child: const Text('Regístrate', style: TextStyle(color: Color(0xFF471AA0), fontWeight: FontWeight.bold),)
                      )
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

class TextFieldRegister extends StatefulWidget {
  final String hintText;
  final Icon? iconRight;

  const TextFieldRegister({
    Key? key,
    required this.hintText,
    this.iconRight,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldRegisterState createState() => _TextFieldRegisterState();
}

class _TextFieldRegisterState extends State<TextFieldRegister> {
  //late TextEditingController _controller;
  bool textoOculto = true; // Oculta el texto
  final outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Color(0xFF9747FF)),
      borderRadius: BorderRadius.circular(15));

  @override
  void initState() {
    super.initState();
    //_controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: _controller,
      obscureText: textoOculto,
      decoration: InputDecoration(
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        hintText: widget.hintText,
        suffixIcon: validarIconoDerecha(widget.iconRight),
      ),
    );
  }

  Widget? validarIconoDerecha(Icon? iconRight) {
    if (iconRight == null) return null;
    return IconButton(
      onPressed: () {
        setState(() {
          textoOculto = !textoOculto;
        });
      },
      icon: iconRight,
    );
  }
}
