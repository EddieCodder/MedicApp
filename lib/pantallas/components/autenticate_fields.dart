import 'package:flutter/material.dart';

class TextFieldRegister extends StatefulWidget {
  final Icon iconLeft;
  final String hintText;
  final Icon? iconRight;
  final bool esOculto;
  final TextEditingController controller;

  const TextFieldRegister({
    super.key,
    required this.iconLeft,
    required this.hintText,
    this.iconRight,
    required this.esOculto,
    required this.controller,
  });

  @override
  TextFieldRegisterState createState() {
    return TextFieldRegisterState();
  }
}

class TextFieldRegisterState extends State<TextFieldRegister> {
  late bool _obscureText;

  final outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Color(0xFF9747FF)),
      borderRadius: BorderRadius.circular(15));

  @override
  void initState() {
    super.initState();
    _obscureText = widget.esOculto;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        prefixIcon: widget.iconLeft,
        hintText: widget.hintText,
        suffixIcon: validarIconoDerecha(widget.iconRight),
      ),
    );
  }

  Widget? validarIconoDerecha(Icon? iconRight) {
    if (iconRight == null) {
      // setState(() {
      //   _obscureText = false;
      // });
      return null;
    }
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