import 'package:flutter/material.dart';
import 'package:practica2/vistas/alumnos.dart';
import 'package:practica2/vistas/carreras.dart';

class Inicio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Design();
  }
}

class Design extends State<Inicio> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD", style: TextStyle(fontSize: 26)),
        backgroundColor: const Color.fromARGB(255, 34, 153, 250),
        centerTitle: true,
      ),

      body: _index == 0 ? carreras() : alumnos(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Carreras"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Alumnos"),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.blue,
        onTap: (Index) {
          setState(() {
            _index = Index;
          });
        },
      ),
    );
  }
}
