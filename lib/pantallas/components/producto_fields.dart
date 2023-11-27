import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final double alto;

  const ReusableRow(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.alto = 1})
      : super(key: key);

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
                    labelText,
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
                      controller: controller,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: alto),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        hintText: '|',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
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
