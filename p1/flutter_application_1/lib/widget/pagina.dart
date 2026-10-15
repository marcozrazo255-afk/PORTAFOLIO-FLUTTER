import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/centro.dart';
import 'package:flutter_application_1/widget/derecho.dart';
import 'package:flutter_application_1/widget/izquierdo.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Disenio();
  }
}

class Disenio extends State<Pagina> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Principal', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.lightBlue,
      ),
      body: _index == 0 ? Izquierdo() : (_index == 1 ? Centro() : Derecho()),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.airlines),
            label: 'Izquierdo',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.add_call), label: 'Centro'),

          BottomNavigationBarItem(icon: Icon(Icons.zoom_out), label: 'Derecho'),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.greenAccent,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
