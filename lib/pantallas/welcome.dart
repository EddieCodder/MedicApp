import 'package:flutter/material.dart';

void main() => runApp(const WelcomeApp());

class WelcomeApp extends StatelessWidget {
  const WelcomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WelcomeScreen();
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Aquí es donde se establece para que no se muestre la etiqueta de depuración
      home: Scaffold(
        body: ResponsiveContainer(
          child: Stack(
            children: [
              const Positioned(
                left: 27,
                top: 57,
                child: Row(
                  children: [
                    LogoButton(),
                    SizedBox(width: 10),
                    SearchBar(),
                  ],
                ),
              ),
              const CenteredContent(),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 90,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveContainer extends StatelessWidget {
  final Widget child;

  const ResponsiveContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [
            Color(0xFFEDDAF0),
            Color(0xFFEDDAF0),
            Color(0xFFB83ECC),
            Color(0xFFC143D6),
            Color(0xFFC143D6),
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(45)),
      ),
      child: child,
    );
  }
}

class LogoButton extends StatelessWidget {
  const LogoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEDDAF0),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: () {
          // Menu Principal
        },
        child: Image.asset("assets/Vector.png", width: 32, height: 32),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 134,
      height: 52,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFF9747FF),
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/Lupa.png", width: 23, height: 23),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Buscar medicamentos, farmacias ...',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/u_actual_1.png", width: 23, height: 23),
          const SizedBox(width: 10),
          const Text(
            'Usar ubicación actual',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductButton extends StatelessWidget {
  const ProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 225,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF9550CE),
          foregroundColor: const Color(0xFFEAD0F6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          // Ir a la lista de productos
        },
        child: const Text(
          'Ver Productos',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class CenteredContent extends StatelessWidget {
  const CenteredContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 96,
            height: 146,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Logo_App.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 134,
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'Lalezar',
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(
                          text: 'Hola Usuario,\n',
                        ),
                        TextSpan(
                          text: 'Buenos días',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 318,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 30),
                        Container(
                          width: 33,
                          height: 33,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/ubicacion.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '¿Dónde quieres recibir tu pedido?',
                              hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const LocationButton(),
                  const SizedBox(height: 16),
                  const ProductButton(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          // Acciones al presionar el botón
        },
        child: Image.asset(imagePath, width: 32, height: 32),
      ),
    );
  }
}
