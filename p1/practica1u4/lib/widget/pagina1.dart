import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Clase();
  }
}

class Clase extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Pagina 1"), backgroundColor: Colors.red),
    );
  }
}
