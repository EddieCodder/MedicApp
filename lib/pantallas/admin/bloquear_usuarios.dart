import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/barra_busqueda.dart';
import '../components/barra_navegacion.dart';

class BloquearUsuariosScreen extends StatelessWidget {
  const BloquearUsuariosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Color.fromARGB(255, 215, 120, 230),
                  Color.fromARGB(255, 251, 246, 251),
                  Color.fromARGB(255, 251, 246, 251),
                  Color.fromARGB(255, 251, 246, 251),
                ],
              ),
            ),
            child: Column(children: [
              SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.12),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: const Color(0xFF471AA0),
                    iconSize: 25,
                    padding: const EdgeInsets.only(left: 30),
                  ),
                  const Text(
                    'Regresar',
                    style: TextStyle(
                      color: Color.fromARGB(255, 56, 20, 126),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    'BLOQUEAR USUARIOS',
                    style: TextStyle(
                      color: Color.fromARGB(255, 45, 16, 102),
                      fontSize: 23,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                )
              ]),
              SizedBox(height: size.height * 0.02),
              const BarraBusqueda(),
              SizedBox(height: size.height * 0.05),
              CustomContainer(
                leftText: "Maria Fernando Martilla Guzman",
                onDelete: () {},
              ),
              SizedBox(height: size.height * 0.03),
              CustomContainer(
                leftText: "Maria Fernando Martilla Guzman",
                onDelete: () {},
              ),
              SizedBox(height: size.height * 0.03),
              CustomContainer(
                leftText: "Maria Fernando Martilla Guzman",
                onDelete: () {},
              ),
              SizedBox(height: size.height * 0.03),
              CustomContainer(
                leftText: "Maria Fernando Martilla Guzman",
                onDelete: () {},
              ),
              SizedBox(height: size.height * 0.03),
              CustomContainer(
                leftText: "Maria Fernando Martilla Guzman",
                onDelete: () {},
              ),
              SizedBox(height: size.height * 0.03),
              CustomContainer(
                leftText: "Maria Fernando Martilla Guzman",
                onDelete: () {},
              )
            ])),
        bottomNavigationBar: const BarraNavegacion(),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String leftText;
  final VoidCallback onDelete;

  const CustomContainer({
    Key? key,
    required this.leftText,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 401,
          height: 55,
          decoration: const BoxDecoration(
            color: Color(0xFFF2EFF4),
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      leftText,
                      style: const TextStyle(
                        color: Color(0xFF5C4F5F),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 30, 25),
                    child: SizedBox(
                      width: 10,
                      height: 10,
                      child: IconButton(
                        onPressed: onDelete,
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
