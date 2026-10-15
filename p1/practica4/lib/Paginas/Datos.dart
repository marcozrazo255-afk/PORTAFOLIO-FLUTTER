import 'package:flutter/material.dart';

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<Datos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Pagina Listas")));
  }
}
