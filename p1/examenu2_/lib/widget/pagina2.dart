import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  final String cadena;
  const Pagina2({super.key, required this.cadena});

  @override
  State<Pagina2> createState() => Clases();
}

class Item {
  final String titulo;
  final String descripcion;
  Item(this.titulo, this.descripcion);
}

class Clases extends State<Pagina2> {
  late List<String> partes;
  late List<Item> items;
  String resultadoNombre = '';

  @override
  void initState() {
    super.initState();
    partes = widget.cadena.split(" - ");

    // Inicializa la lista con los datos recibidos
    items = [
      Item('Nombre', partes[0]),
      Item('Género', partes[1]),
      Item('Número', partes[2]),
    ];
  }

  void agregar() {
    setState(() {
      resultadoNombre = ' ${partes[2]}, ${partes[1]}, ${partes[0]}';
      items.add(Item('Nuevo', resultadoNombre));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nombre: ${partes[0]}",
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            Text(
              "Género: ${partes[1]}",
              style: TextStyle(color: const Color.fromARGB(255, 20, 5, 5)),
            ),
            Text(
              "Número: ${partes[2]}",
              style: TextStyle(color: const Color.fromARGB(255, 19, 4, 4)),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: Icon(Icons.person),
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
