import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  final String cadena;
  const Pagina2({super.key, required this.cadena});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Clases();
  }
}

class Item {
  //item de la lista
  final String descripcion;
  final String titulo;
  Item(this.titulo, this.descripcion);
}

class Clases extends State<Pagina2> {
  String a = "";
  String p1 = "";
  List<Item> items = [Item('titulo', 'descripcion')];

  void agregar() {
    setState(() {
      int indexLista = items.length + 1;
      items.add(Item('titulo $indexLista', 'descripcion $indexLista'));
    });
  }

  @override
  void initState() {
    super.initState();
    int p = widget.cadena.indexOf(" - ");
    a = widget.cadena.substring(0, p);
    p1 = widget.cadena.substring(p + 1);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("${a}", style: TextStyle(color: Colors.white)),
            Text("${p1}", style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text(items[index].titulo),
            subtitle: Text(items[index].descripcion),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregar,
        child: Icon(Icons.add),
      ),
    );
  }
}
