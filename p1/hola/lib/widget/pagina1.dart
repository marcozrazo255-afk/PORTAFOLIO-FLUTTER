import 'package:flutter/material.dart';

class pagina1 extends StatefulWidget {
  const pagina1({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<pagina1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola'),
        backgroundColor: Colors.lightGreenAccent,
      ),
    );
  }
}
