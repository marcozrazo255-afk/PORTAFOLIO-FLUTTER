import 'package:examenfinal/basedatos/basedatoshelper.dart';
import 'package:flutter/material.dart';

class PaginaListaVehiculos extends StatefulWidget {
  const PaginaListaVehiculos({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PaginaListaVehiculosState();
  }
}

class _PaginaListaVehiculosState extends State<PaginaListaVehiculos> {
  List<Map<String, dynamic>> vehiculos = [];
  final TextEditingController n = TextEditingController();
  final TextEditingController m = TextEditingController();
  final TextEditingController p = TextEditingController();

  @override
  void initState() {
    super.initState();
    cargarVehiculos();
  }

  String formato(String nombre, String modelo) {
    final primera = nombre.isNotEmpty ? nombre[0] : '';
    final ultima = nombre.isNotEmpty ? nombre[nombre.length - 1] : '';
    final ultimosDos = modelo.length >= 2
        ? modelo.substring(modelo.length - 2)
        : modelo;
    return '$primera$ultima$ultimosDos'.toUpperCase();
  }

  Future<void> cargarVehiculos() async {
    final data = await Basedatoshelper().obtenerVehiculos();
    setState(() {
      vehiculos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Vehículos")),
      body: ListView.builder(
        itemCount: vehiculos.length,
        itemBuilder: (context, index) {
          final v = vehiculos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.directions_car),
              title: Text("Código: ${formato(v['marca'], v['modelo'])}"),
              subtitle: Text("Precio: ${v['precio']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () async {
                      //creamos los controladores de texto
                      final nombreController = TextEditingController(
                        text: v['marca'],
                      );
                      final modeloController = TextEditingController(
                        text: v['modelo'],
                      );
                      final precioController = TextEditingController(
                        text: v['precio'],
                      );

                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Editar Vehículo"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //cajas de texto para el nombre, modelo y precio
                                TextField(
                                  controller: nombreController,
                                  decoration: const InputDecoration(
                                    labelText: "Nombre",
                                  ),
                                ),
                                TextField(
                                  controller: modeloController,
                                  decoration: const InputDecoration(
                                    labelText: "Modelo",
                                  ),
                                ),
                                TextField(
                                  controller: precioController,
                                  decoration: const InputDecoration(
                                    labelText: "Precio",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              //boton para cancelar
                              TextButton(
                                child: const Text("Cancelar"),
                                onPressed: () => Navigator.pop(context),
                              ),
                              //boton para guardar
                              TextButton(
                                child: const Text("Guardar"),
                                onPressed: () async {
                                  String codigo = formato(n.text, m.text);

                                  await Basedatoshelper().modificarVehiculo(
                                    v['id'],
                                    codigo,
                                    nombreController.text,
                                    modeloController.text,
                                    precioController.text,
                                  );

                                  Navigator.pop(context);
                                  cargarVehiculos();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),

                  //boton para eliminar
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await Basedatoshelper().eliminarVehiculo(v['id']);
                      cargarVehiculos();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
