import 'package:flutter/material.dart';
import 'package:practica6/Paginas/Home.dart';
import 'package:practica6/Paginas/Listas.dart';
import 'package:practica6/Paginas/Datos.dart';

class Maine extends StatefulWidget {
  const Maine({super.key});

  @override
  State<StatefulWidget> createState() {
    return base();
  }
}

class base extends State<Maine> {
  int _index = 0;
  final List<Widget> _paginas = [Home(), Listas(), Datos()];
  void clickIndex(int i) {
    setState(() {
      _index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator Drawer', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 155, 145, 234),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(5),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 145, 234),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/hogar.png'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aplicacion',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Times New Roman",
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text('Desarollado por'),
                      Text(
                        'TSJ Zapotlanejo',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Arial Arrow",
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.lock_clock),
              title: Text("Home"),
              onTap: () {
                clickIndex(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_clock_outlined),
              title: Text("Lista"),
              onTap: () {
                clickIndex(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_clock_rounded),
              title: Text("Datos"),
              onTap: () {
                clickIndex(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _paginas[_index],
    );
  }
}
