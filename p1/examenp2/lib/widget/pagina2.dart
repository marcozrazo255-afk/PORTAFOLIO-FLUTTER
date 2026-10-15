import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  final String nombre;
  final String nip;

  const Pagina2({super.key, required this.nombre, required this.nip});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 2"),
        backgroundColor: const Color.fromARGB(255, 3, 242, 255),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text('Retirar'),
                    icon: Icon(Icons.monetization_on_sharp),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text('Deposito'),
                    icon: Icon(Icons.monetization_on_outlined),
                  ),
                ),
                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text('Monto'),
                    icon: Icon(Icons.monetization_on_outlined),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Nombre: ${widget.nombre}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "NIP: ${widget.nip}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
