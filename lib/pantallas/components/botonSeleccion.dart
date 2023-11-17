// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/login.dart';
import 'package:medic_app/pantallas/welcome.dart';

// ignore: must_be_immutable
class BotonSeleccion extends StatelessWidget {
  String texto;
  String pantall = 'RegisterScreen()';

  BotonSeleccion({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,

        //padding: EdgeInsets.all(0), // Ajusta el relleno según tus preferencias
      ),
      child: Container(
          width: 325,
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0x00EAD0F6), Color(0xFFEAD0F6)],
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  texto,
                  style: const TextStyle(
                    color: Color(0xFF5C4F5F),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Color(0xFF471AA0),
                size: 20,
              ),
            ],
          )),
    );
  }
}
