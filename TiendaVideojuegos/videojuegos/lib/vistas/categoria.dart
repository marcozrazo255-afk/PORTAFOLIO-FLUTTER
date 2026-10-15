import 'package:flutter/material.dart';

class Categoria extends StatefulWidget {
  const Categoria({super.key});

  @override
  State<Categoria> createState() => _MiPantallaState();
}

class _MiPantallaState extends State<Categoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Categoria')));
  }
}
