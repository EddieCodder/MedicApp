import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // TODO: Volver a LoginScreen
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
                        height: 7,
                      ),
                    ),
                    Image.asset(
                      'assets/logoApp.png',
                      width: 65,
                      height: 99,
                    )
                  ],
                ),
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
                const TextFieldRegister(
                  iconLeft: Icon(Icons.person_outline),
                  hintText: 'Nombre',
                ),
                SizedBox(height: size.height * 0.02),
                const TextFieldRegister(
                  iconLeft: Icon(Icons.mail_outline),
                  hintText: 'Correo',
                ),
                SizedBox(height: size.height * 0.02),
                const TextFieldRegister(
                  iconLeft: Icon(Icons.lock_outline_rounded),
                  iconRight: Icon(Icons.remove_red_eye_outlined),
                  hintText: 'Contraseña',
                ),
                SizedBox(height: size.height * 0.02),
                const TextFieldRegister(
                  iconLeft: Icon(Icons.lock_outline_rounded),
                  iconRight: Icon(Icons.remove_red_eye_outlined),
                  hintText: 'Confirmar Contraseña',
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      // TODO: Realizar operacion de Registro
                    },
                    label: const Text('Registrarse'),
                    extendedPadding:
                        EdgeInsets.symmetric(horizontal: size.width),
                    backgroundColor: const Color(0xFF9550CE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), 
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Ya tiene una cuenta? ', style: TextStyle(color: Color(0xFF471AA0))),
                    TextButton(
                      onPressed: () {
                        // TODO: Redireccionar a LoginScreen
                      },
                      child: const Text('Inicia Sesion Aquí', style: TextStyle(color: Color(0xFF471AA0), fontWeight: FontWeight.bold),)
                    )
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

class TextFieldRegister extends StatefulWidget {
  final Icon iconLeft;
  final String hintText;
  final Icon? iconRight;

  const TextFieldRegister({
    Key? key,
    required this.iconLeft,
    required this.hintText,
    this.iconRight,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldRegisterState createState() => _TextFieldRegisterState();
}

class _TextFieldRegisterState extends State<TextFieldRegister> {
  late TextEditingController _controller;
  bool _obscureText = true;

    final outlineInputBorder = OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFF9747FF)),
          borderRadius: BorderRadius.circular(15));

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        prefixIcon: widget.iconLeft,
        hintText: widget.hintText,
        suffixIcon: validarIconoIzquierda(widget.iconRight),
      ),
    );
  }

  Widget? validarIconoIzquierda(Icon? iconRight) {
    if (iconRight == null) return null;
    return IconButton(
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      icon: iconRight,
    );
  }
}