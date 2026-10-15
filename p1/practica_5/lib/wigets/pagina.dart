import 'package:flutter/material.dart';
import 'package:practica_5/wigets/suma.dart';
import 'package:practica_5/wigets/resta.dart';
import 'package:practica_5/wigets/multiplicacion.dart';
import 'package:practica_5/wigets/division.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => Disenio();
}

class Disenio extends State<Pagina> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Principal', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 18, 161, 227),
      ),
      body: _index == 0
          ? Suma()
          : _index == 1
          ? Resta()
          : _index == 2
          ? Multiplicacion()
          : Division(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 5, 113, 255),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Suma'),
          BottomNavigationBarItem(icon: Icon(Icons.remove), label: 'Resta'),
          BottomNavigationBarItem(
            icon: Icon(Icons.start),
            label: 'Multiplicacion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_alt),
            label: 'Division',
          ),
        ],
        currentIndex: _index,
        selectedItemColor: const Color.fromARGB(255, 7, 12, 10),
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
