import '../components/barraNavegacion.dart';
import 'package:flutter/material.dart';

void main() => runApp(const OpcionesAdmin());

class OpcionesAdmin extends StatelessWidget {
  const OpcionesAdmin({Key? key}) : super(key: key);

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
                Color.fromARGB(255, 228, 222, 229),
                Color.fromARGB(255, 215, 120, 230),
                Color.fromARGB(255, 227, 147, 239),
              ],
            ),
          ),
          child: Column(
            children: [
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
                    iconSize: 15,
                    padding: const EdgeInsets.only(left: 30),
                  ),
                  const Text(
                    'Opciones de administrador',
                    style: TextStyle(
                      color: Color.fromARGB(255, 33, 11, 75),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              'U',
                              style: TextStyle(
                                color: Color(0xFF685252),
                                fontSize: 45,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5, bottom: 20),
                        child: Text(
                          'Mi perfil',
                          style: TextStyle(
                            color: Color.fromARGB(255, 140, 139, 139),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2, left: 0),
                        child: Row(children: [
                          Text(
                            'NOMBRE NOMBRE2 APELLIDO',
                            style: TextStyle(
                              color: Color(0xFF5C4F5F),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              height: 0,
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ],
              ),
              const Center(
                child: CustomContainer(text: 'Revisar documentos'),
              ),
              const Center(
                child: CustomContainer(text: 'Revisar documentos'),
              ),
              const Center(
                child: CustomContainer(text: 'Revisar documentos'),
              ),
              const Center(
                child: CustomContainer(text: 'Revisar documentos'),
              ),
              const Center(
                child: CustomContainer(text: 'Revisar documentos'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BarraNavegacion(),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String text;

  const CustomContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 326,
          height: 43,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0x00EAD0F6), Color(0xFFEAD0F6)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF5C4F5F),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_forward_ios),
          color: const Color(0xFF471AA0),
          iconSize: 15,
          padding: const EdgeInsets.only(left: 30),
        ),
      ],
    );
  }
}
