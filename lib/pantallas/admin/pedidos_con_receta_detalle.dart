import 'package:flutter/material.dart';
import 'package:medic_app/pantallas/admin/buscar_producto.dart';
import 'package:medic_app/pantallas/admin/correo_confirmacion.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:medic_app/pantallas/admin/buscar_producto.dart';
import 'package:medic_app/pantallas/admin/detalles_producto_Receta.dart';
import 'package:medic_app/pantallas/components/barra_navegacion.dart';

import '../components/barra_busqueda.dart';

class PedidosConRecetaDetalleScreen extends StatefulWidget {
  const PedidosConRecetaDetalleScreen({super.key});

  @override
  State<PedidosConRecetaDetalleScreen> createState() =>
      _PedidosConRecetaDetalleScreenState();
}

class _PedidosConRecetaDetalleScreenState
    extends State<PedidosConRecetaDetalleScreen> {
  String? _imagePath =
      "https://peru21.pe/resizer/6N2oKjFMN0_fvYMKLN1k15Y3Z6Y=/980x0/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/N4YOM4PUYBAMTCSM3P77IIHUDY.jpg";
  Future<void> _getImage() async {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height + 100,
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
            child: Column(
              children: [
                SizedBox(height: size.height * 0.004),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '25/10/2023',
                              style: TextStyle(
                                color: Color(0xFF5C4F5F),
                                fontSize: 30,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 130),
                          child: Column(
                            children: [
                              Text(
                                '#0004',
                                style: TextStyle(
                                  color: Color(0xFF5C4F5F),
                                  fontSize: 30,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const BarraBusqueda(),
                SizedBox(height: size.height * 0.03),
                Row(children: [
                  SizedBox(width: size.width * 0.10),
                  DropdownButton<String>(
                    value: 'Pendiente',
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        if (newValue == 'Pendiente') {
                          // Realizar el cambio del valor
                        } else if (newValue == 'Entregado') {
                          // Realizar el cambio del valor
                        }
                      }
                    },
                    items: <String>['Pendiente', 'Entregado', 'Enviando']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFAC37BF),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              height: 0,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ]),
                SizedBox(height: size.height * 0.025),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Container(
                          width: 205,
                          height: 35,
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
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Calle los Girasoles 204',
                                style: TextStyle(
                                  color: Color(0xFF5C4F5F),
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                InkWell(
                  onTap: _getImage,
                  child: Container(
                    width: 307,
                    height: 357,
                    decoration: ShapeDecoration(
                      color: const Color(0x00D9D9D9),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: _imagePath != null
                        ? Image.network(
                            _imagePath!,
                            width: 207,
                            height: 207,
                            fit: BoxFit.cover,
                          )
                        : const Center(
                            child: Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Column(children: [
                    SizedBox(height: size.height * 0.02),
                    const BarraLateralButton(
                      topLeftText: 'Amoxicilina',
                      bottomLeftText: '4.00',
                    ),
                    SizedBox(height: size.height * 0.02),
                    const BarraLateralButton(
                      topLeftText: 'Amoxicilina',
                      bottomLeftText: '4.00',
                    ),
                    SizedBox(height: size.height * 0.02),
                    const BarraLateralButton(
                      topLeftText: 'Amoxicilina',
                      bottomLeftText: '4.00',
                    ),
                    SizedBox(height: size.height * 0.02),
                    const BarraLateralButton(
                      topLeftText: 'Amoxicilina',
                      bottomLeftText: '4.00',
                    ),
                    SizedBox(height: size.height * 0.02),
                  ]),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: FloatingActionButton(
                heroTag: 'uniqueTagForEmailButton',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CorreoConfirmacion(),
                    ),
                  );
                }, // TODO: Enviar el correro para ver la entrega del producto
                backgroundColor: const Color.fromARGB(255, 99, 47, 141),
                child: const Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: FloatingActionButton(
                heroTag: 'uniqueTagForDetalleButton',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuscarProductoScreen(),
                    ),
                  );
                },
                backgroundColor: const Color.fromARGB(255, 99, 47, 141),
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BarraNavegacion(),
      ),
    );
  }
}

class BarraLateralButton extends StatefulWidget {
  final String topLeftText;
  final String bottomLeftText;

  const BarraLateralButton({
    Key? key,
    required this.topLeftText,
    required this.bottomLeftText,
  }) : super(key: key);

  @override
  BarraLateralButtonState createState() => BarraLateralButtonState();
}

class BarraLateralButtonState extends State<BarraLateralButton> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
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
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        widget.topLeftText,
                        style: const TextStyle(
                          color: Color(0xFF5C4F5F),
                          fontSize: 25,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7, left: 0),
                      child: Text(
                        'S/. ${widget.bottomLeftText} por Unidad',
                        style: const TextStyle(
                          color: Color(0xFF5C4F5F),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              if (isExpanded)
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '5 Unidades',
                        style: TextStyle(
                          color: Color(0xFFAC37BF),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'S/. 20 Soles',
                        style: TextStyle(
                          color: Color(0xFF5C4F5F),
                          fontSize: 23,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
