import 'package:examen2oport/api/api_servicios.dart'; // Tu importación original
import 'package:flutter/material.dart';

class Saldo extends StatefulWidget {
  final String nipRecibido;

  const Saldo({super.key, required this.nipRecibido});

  @override
  State<Saldo> createState() => _MovimientoState();
}

class _MovimientoState extends State<Saldo> {
  List usuarios = [];

  TextEditingController NewRetiro = TextEditingController();
  TextEditingController NewDeposito = TextEditingController();

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  void cargarDatos() async {
    var datos = await ApiServicios.modificarSaldos();
    setState(() {
      usuarios = datos; // <-- Cambiado de datos = null a usuarios = datos
    });
  }

  void modificar(int id, String retiro, String abono) {
    NewRetiro.text = retiro;
    NewDeposito.text = abono;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("saldo"),
          content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (NewRetiro.text.isEmpty) NewRetiro.text = retiro;
                if (NewDeposito.text.isEmpty) NewDeposito.text = abono;

                cargarDatos();
                Navigator.pop(context);
              },
              child: const Text("Abonar"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Retirar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saldo'),
        backgroundColor: const Color.fromARGB(255, 180, 243, 243),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_downward),
                    label: const Text("Retirar"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_upward),
                    label: const Text("Depositar"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            Expanded(
              child: usuarios.isEmpty
                  ? const Center(child: Text("No hay movimientos registrados"))
                  : ListView.builder(
                      itemCount: usuarios.length,
                      itemBuilder: (context, index) {
                        var item = usuarios[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            title: Text("Operación #${item[0]}"),
                            subtitle: Text(
                              "Retiro: \$${item[1]} | Depósito: \$${item[2]}",
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                modificar(
                                  int.parse(item[0].toString()),
                                  item[1].toString(),
                                  item[2].toString(),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
