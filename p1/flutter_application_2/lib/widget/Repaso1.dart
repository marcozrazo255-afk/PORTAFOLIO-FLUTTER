import 'package:flutter/material.dart';

class Repaso1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<Repaso1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(child: Text('Hola mundo')),
    );
  }
}
