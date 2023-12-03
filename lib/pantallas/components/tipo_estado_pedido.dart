import 'package:flutter/material.dart';

class EstadoPedido extends StatelessWidget {
  final String estado;
  const EstadoPedido({
    Key? key,
    required this.estado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            estado,
            style: const TextStyle(
              color: Color(0xFF5C4F5F),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
