import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/components/barra_busqueda.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../components/barra_navegacion.dart';
import 'opciones_admin.dart';

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
              const BarraRetorno(
                text: 'Mis Pedidos',
                widget_viaje: OpcionesAdmin(),
                tamLetra: 30,
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
              Expanded(
                child: ListView.builder(
                  itemCount: Provider.of<Auth>(context).list.length,
                  itemBuilder: (context, index) {
                    // Filtrar usuarios bloqueados
                    final usuario = Provider.of<Auth>(context).list[index];
                    if (usuario.esBloqueado == 1) {
                      return Container(); // Devolver un contenedor vacío para usuarios bloqueados
                    }
                    return CustomContainer(
                      leftText: usuario.nombreUsuario,
                      onDelete: () {
                        Provider.of<Auth>(context, listen: false)
                            .bloquearUsuario(usuario.codigoUsuario);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BloquearUsuariosScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
            child: Row(
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
                GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
