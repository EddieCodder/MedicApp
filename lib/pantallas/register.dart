import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/login.dart';
import 'package:medic_app/pantallas/splash_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'components/autenticate_fields.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _nombreUsuarioController =
      TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController1 = TextEditingController();
  final TextEditingController _contrasenaController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: const Color(0xFF471AA0),
                      iconSize: 15,
                      padding: const EdgeInsets.only(left: 30),
                    ),
                    const Text(
                      'Regresar',
                      style: TextStyle(
                        color: Color(0xFF471AA0),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.2,
                    ),
                    const Text(
                      'MedicApp',
                      style: TextStyle(
                        color: Color(0xFF471AA0),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Image.asset(
                      'assets/logoApp.png',
                      width: 65,
                      height: 99,
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                const Text(
                  'Regístrate',
                  style: TextStyle(
                    color: Color(0xFF471AA0),
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                TextFieldRegister(
                  iconLeft: const Icon(Icons.person_outline),
                  hintText: 'Nombre',
                  esOculto: false,
                  controller: _nombreUsuarioController,
                ),
                SizedBox(height: size.height * 0.02),
                TextFieldRegister(
                  iconLeft: const Icon(Icons.mail_outline),
                  hintText: 'Correo',
                  esOculto: false,
                  controller: _correoController,
                ),
                SizedBox(height: size.height * 0.02),
                TextFieldRegister(
                  iconLeft: const Icon(Icons.lock_outline_rounded),
                  iconRight: const Icon(Icons.remove_red_eye_outlined),
                  hintText: 'Contraseña',
                  esOculto: true,
                  controller: _contrasenaController1,
                ),
                SizedBox(height: size.height * 0.02),
                TextFieldRegister(
                  iconLeft: const Icon(Icons.lock_outline_rounded),
                  iconRight: const Icon(Icons.remove_red_eye_outlined),
                  hintText: 'Confirmar Contraseña',
                  esOculto: true,
                  controller: _contrasenaController2,
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      // TODO: Realizar operacion de Registro
                      final nombreUsuario = _nombreUsuarioController.text;
                      final correo = _correoController.text;
                      final contrasena1 = _contrasenaController1.text;
                      final contrasena2 = _contrasenaController2.text;

                      if (contrasena1 == contrasena2) {
                        Provider.of<Auth>(context, listen: false).signup(nombreUsuario, correo, contrasena1);
                        if ( Provider.of<Auth>(context, listen: false).esAutenticado == 1 ) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SplashScreen(),
                            ),
                          );
                        }
                      } else {
                        mostrarError(context, 'Las contraseñas no coinciden');
                      }

                    },
                    label: const Text('Registrarse'),
                    extendedPadding:
                        EdgeInsets.symmetric(horizontal: size.width),
                    backgroundColor: const Color(0xFF9550CE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Ya tiene una cuenta? ',
                        style: TextStyle(color: Color(0xFF471AA0))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Inicia Sesion Aquí',
                          style: TextStyle(
                              color: Color(0xFF471AA0),
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void mostrarError(BuildContext context, String mensaje) {
  final snackBar = SnackBar(
    content: Text(mensaje),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {
        // Al hacer clic en "OK", puedes realizar alguna acción si es necesario.
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
