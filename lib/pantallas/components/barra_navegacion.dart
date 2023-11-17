/*import 'dart:html';

import 'package:flutter/material.dart';

class BarrraNavegacion extends StatelessWidget {
  const BarrraNavegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: const BoxDecoration(
        color: Color(0xFFD9D9D9),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ImageButton(
            imagePath: "assets/casa.png",
            backgroundColor: Color(0xFFD9D9D9),
          ),
          ImageButton(
            imagePath: "assets/heart.png",
            backgroundColor: Color(0xFFD9D9D9),
          ),
          ImageButton(
            imagePath: "assets/list.png",
            backgroundColor: Color(0xFFD9D9D9),
          ),
          ImageButton(
            imagePath: "assets/user.png",
            backgroundColor: Color(0xFFD9D9D9),
          ),
        ],
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;

  const ImageButton({
    super.key, 
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: Image.asset(imagePath, width: 32, height: 32),
    );
  }
}*/

import 'package:flutter/material.dart';

void main() {
  runApp(const BarraNavegacion());
}

class BarraNavegacion extends StatefulWidget {
  const BarraNavegacion({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<BarraNavegacion> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Sin animación

      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/casa.png'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/heart.png'),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/list.png', height: 40,),
          label: 'Mis pedidos',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/user.png', height: 40,),
          label: 'Perfil',
        ),
      ],

      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
