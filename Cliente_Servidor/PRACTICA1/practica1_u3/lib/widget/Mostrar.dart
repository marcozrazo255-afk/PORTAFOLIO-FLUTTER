import 'package:flutter/material.dart';
import 'package:practica1_u3/servicios/api_servicios.dart';

class MostrarUsuarios extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<MostrarUsuarios> {
  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();
  List usuarios = [];
  String resultado = "";

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  void cargarDatos() async {
    var datos = await ApiServicios.Datos();
    setState(() {
      usuarios = datos;
    });
  }

  void Agregar() async {
    String u = usuario.text;
    String p = password.text;
    if (u.isNotEmpty && p.isNotEmpty) {
      var res = await ApiServicios.insertar(u, p);
      setState(() => resultado = res);
    } else {
      print("Faltan datos");
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar un nuevo usuario"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usuario,
                style: TextStyle(fontStyle: FontStyle.normal),
                decoration: InputDecoration(labelText: 'Usuario'),
              ),
              SizedBox(height: 3),
              TextField(
                controller: password,
                style: TextStyle(fontStyle: FontStyle.normal),
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mostrar Usuarios"),
        backgroundColor: const Color.fromARGB(150, 162, 69, 199),
      ),
      body: usuarios.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                var u = usuarios[index];
                return Card(
                  child: ListTile(
                    title: Text(u["nombre"] ?? ""),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID: ${u["id"]}"),
                        Text("NOMBRE: ${u["usuario"] ?? ""}"),
                        Text("PASSWORD: ${u["password"]}"),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await ApiServicios.eliminar(
                              int.parse(u["id"].toString()),
                            ); // Cambiado a clave del Map
                            setState(() {
                              usuarios.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: Agregar,
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
