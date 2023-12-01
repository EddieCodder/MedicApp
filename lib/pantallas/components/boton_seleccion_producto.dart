// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/admin/agregar_producto.dart';
import 'package:medic_app/pantallas/admin/pedidos_sin_receta.dart';
import 'package:medic_app/pantallas/categorias.dart';
import 'package:medic_app/pantallas/login.dart';
import 'package:medic_app/pantallas/tipo_pedido.dart';
import 'package:medic_app/pantallas/welcome.dart';
import 'package:provider/provider.dart';

import '../../providers/auth.dart';

// ignore: must_be_immutable
class BotonSeleccionProducto extends StatelessWidget {
  String texto;
  double precio;
  bool disp = true;

  BotonSeleccionProducto({super.key, required this.texto, required this.disp, required this.precio});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navegarA(context, widgetName: texto);
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
          width: 370,
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image.asset('assets/producto.png'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        texto,
                        style: const TextStyle(
                          color: Color(0xFF5C4F5F),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                      Text(
                        'S/. $precio por unidad',
                        style: const TextStyle(
                          color: Color(0xFF5C4F5F),
                          fontSize: 11,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _disponibilidad(),
              ),
            ],
          )),
    );
  }

  Text _disponibilidad() {
    if (disp) {
      return const Text(
        'Disponible',
        style: TextStyle(
          color: Color(0xFF2CC51F),
          fontSize: 13,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
          height: 0,
        ),
      );
    }
    return const Text(
      'Agotado',
      style: TextStyle(
        color: Color(0xFFED1A1A),
        fontSize: 13,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w800,
        height: 0,
      ),
    );
  }

  void _navegarA(BuildContext context, {required String widgetName}) {
    Widget widget;

    switch (widgetName) {
      case 'Realizar Pedido':
        widget = const SelecPedidoScreen();
        break;
      case 'Mis pedidos':
        widget =
            LoginScreen(); // TODO: CAMBIAR LA REDIRECCIÓN A PANTALLA DE MIS PEDIDOS
        break;
      case 'Información de la cuenta':
        widget =
            LoginScreen(); // TODO: CAMBIAR LA REDIRECCIÓN A PANTALLA DE INFORMACIÓN DE LA CUENTA
        break;
      case 'Contáctanos':
        widget =
            LoginScreen(); // TODO: CAMBIAR LA REDIRECCIÓN A PANTALLA DE CONTACTO
        break;
      case 'Ayuda':
        widget =
            LoginScreen(); // TODO: CAMBIAR LA REDIRECCIÓN A PANTALLA DE AYUDA
        break;
      case 'Cerrar Sesión':
        Provider.of<Auth>(context, listen: false).logout();
        widget = LoginScreen();
        break;

      // PARA EL TIPO DE PEDIDO
      case 'Sin Receta':
        widget = const CategorySceen();
        break;

      case 'Con Receta':
        widget =
            const WelcomeScreen(); // TODO: CAMBIAR LA REDIRECCIÓN A PANTALLA DE PEDIDO CON RECETA
        break;

      //  OPCIONES ADMIN
      //CON RECETA
      case 'Realizar Pedido (Con Receta)':
        widget = const WelcomeScreen();
        break;

      case 'Realizar Pedido (Sin Receta)':
        widget = const PedidosSinReceta();
        break;

      case 'Agregar Producto':
        widget = AgregarProductoScreen();
        break;
      default:
        throw ArgumentError('Nombre de widget no reconocido: $widgetName');
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
