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
