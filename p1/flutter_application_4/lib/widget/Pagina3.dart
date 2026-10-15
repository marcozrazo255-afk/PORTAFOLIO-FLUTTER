import 'package:flutter/material.dart';

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

  @override
  Widget build(BuildContext context) {
    return Otra();
  }
}

class Otra extends StatefulWidget {
  const Otra({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Otra();
  }
}

class _Otra extends State<Otra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: implement build
      appBar: AppBar(title: Text("Pagina 3")),
    ); // Scaffold
  }
}
