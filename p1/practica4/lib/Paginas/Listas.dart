import 'package:flutter/material.dart';

class Listas extends StatefulWidget {
  const Listas({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<Listas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Image.asset('assets/gato.jpg'),
            Image.asset('assets/ghd.webp'),
            Image.asset('assets/imagenes.png'),
            Image.asset('assets/hola.png'),
          ],
        ),
      ),
    );
  }
}
