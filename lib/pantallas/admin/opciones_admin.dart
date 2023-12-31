import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/components/app_bar_retorno.dart';
import 'package:medic_app/pantallas/components/boton_seleccion.dart';
import 'package:medic_app/pantallas/info_user.dart';
import 'package:medic_app/pantallas/menu.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../components/barra_navegacion.dart';

class OpcionesAdmin extends StatelessWidget {
  const OpcionesAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final usuariosProvider = Provider.of<Auth>(context, listen: false);
    final usuario = usuariosProvider.list.firstWhere(
        (user) => user.codigoUsuario == usuariosProvider.codigoUsuario);

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
            const BarraRetorno(
              text: 'Opciones de Administrador',
              widget_viaje: MenuScreen(),
              tamLetra: 30,
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Stack(children: [
                        const DecoratedBox(
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
                        Positioned(
                          top: -5,
                          right: -5,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit),
                            color: const Color.fromARGB(255, 110, 77, 77),
                            iconSize: 24,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ]),
                Row(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 5),
                              child: Text(
                                'Mi perfil',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 140, 139, 139),
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 2, left: 10),
                                  child: Row(children: [
                                    Text(
                                      "${usuario.nombre} ${usuario.apellido}",
                                      style: const TextStyle(
                                        color: Color(0xFF5C4F5F),
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w800,
                                        height: 0,
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Column(children: [
              BotonSeleccion(
                texto: 'Realizar Pedido (Con Receta)',
              ),
              SizedBox(height: size.height * 0.03),
              BotonSeleccion(
                texto: 'Realizar Pedido (Sin Receta)',
              ),
              SizedBox(height: size.height * 0.03),
              BotonSeleccion(
                texto: 'Agregar producto',
              ),
              SizedBox(height: size.height * 0.03),
              BotonSeleccion(
                texto: 'Editar producto(s)',
              ),
              SizedBox(height: size.height * 0.03),
              BotonSeleccion(
                texto: 'Bloquear usuarios',
              ),
            ])
          ]),
        ),
        bottomNavigationBar: const BarraNavegacion(),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String text;
  final Widget screen;

  const CustomContainer({super.key, required this.screen, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
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
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Color(0xFF5C4F5F),
                      fontSize: 22,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.01),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screen,
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: const Color(0xFF471AA0),
                      iconSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
