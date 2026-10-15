import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return clase();
  }
}

class clase extends State<Pagina2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verificacion de codigo",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: const Color.fromARGB(255, 56, 173, 142),
      ),
    );
  }
}
