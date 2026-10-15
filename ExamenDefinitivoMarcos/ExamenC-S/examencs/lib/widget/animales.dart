import 'dart:convert';
import 'package:examencs/api/api.servicios.dart';
import 'package:flutter/material.dart';

class Animales extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Masc();
  }
}

class Masc extends State<Animales> {
  List animales = [];
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    obtenerDatos();
  }

  void obtenerDatos() async {
    try {
      var respuestaString = await ApiServicios.mostrarAnimales();

      setState(() {
        animales = jsonDecode(respuestaString);
        cargando = false;
      });
    } catch (e) {
      setState(() {
        cargando = false;
      });
      print("Error al decodificar datos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Datos de Mascotas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: cargando
            ? const CircularProgressIndicator()
            : animales.isEmpty
            ? const Text("No hay mascotas registradas")
            : ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: animales.length,
                itemBuilder: (context, index) {
                  var v = animales[index];

                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    child: ListTile(
                      title: Text(
                        "Nombre: ${v['nombre'] ?? 'Sin nombre'}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text("Raza: ${v['raza'] ?? 'Sin raza'}"),
                          Text("Año: ${v['anio'] ?? 'Sin año'}"),
                          Text(
                            "Descripción: ${v['descripcion'] ?? 'Sin descripción'}",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
