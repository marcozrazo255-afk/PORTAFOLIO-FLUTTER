import 'package:flutter/material.dart';
import 'package:practica1u3/widget/pagina1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Pagina1());
  }
}
