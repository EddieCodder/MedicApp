import 'package:flutter/material.dart';

class ReusableRow extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const ReusableRow({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  ReusableRowState createState() => ReusableRowState();
}

class ReusableRowState extends State<ReusableRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 430,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.labelText,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.32),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: widget
                            .controller.text, // Utilizar el valor actualizado
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 11, 0, 0),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {},
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
