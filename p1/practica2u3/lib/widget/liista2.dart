import 'package:flutter/material.dart';

class Liista2 extends StatefulWidget {
  const Liista2({super.key});
  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Item {
  final String produc;
  final String descrip;
  final String preci;
  Item({required this.produc, required this.descrip, required this.preci});
}

class Clase extends State<Liista2> {
  TextEditingController producto = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController precio = TextEditingController();
  List<Item> items =[

];

  void _agregar() {
    setState(() {
      final String p = producto.text;
      final String d = descripcion.text;
      final String pr = precio.text;
      if (p.isNotEmpty && d.isNotEmpty && pr.isNotEmpty) {
        items.add(
          Item(
            produc: 'Producto: $p',
            descrip: 'Descripcion: $d',
            preci: 'Precio: $pr',
          ),
        );
        producto.clear();
        descripcion.clear();
        precio.clear();
      } else {
        print("Datos vacios");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista 2')),
      backgroundColor: const Color.fromARGB(255, 3, 173, 203),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                TextFormField(
                  controller: producto,
                  decoration: InputDecoration(
                    labelText: "Escribe un producto",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: descripcion,
                  decoration: InputDecoration(
                    labelText: "Escribe la descripcion",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: precio,
                  decoration: InputDecoration(
                    labelText: "Escribe un precio",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    onPressed: _agregar,
                    label: Text("Agregar", style: TextStyle(fontSize: 18)),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => Card(
                      color: const Color.fromARGB(
                        255,
                        2,
                        251,
                        226,
                      ), // Fondo de la tarjeta
                      child: ListTile(
                        leading: Icon(
                          Icons.wysiwyg_sharp,
                          color: const Color.fromARGB(255, 0, 11, 138),
                        ),
                        title: Text(
                          items[index].produc,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].descrip,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              items[index].preci,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.apartment_outlined,
                          color: const Color.fromARGB(255, 0, 11, 138),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
