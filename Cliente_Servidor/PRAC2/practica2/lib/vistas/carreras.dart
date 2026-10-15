import 'package:flutter/material.dart';
import 'package:practica2/api/api_servicios.dart';

class carreras extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<carreras> {
  final TextEditingController nombre = TextEditingController();
  final TextEditingController password = TextEditingController();
  String resultado = "";
  List usuarios = [];

  void initState() {
    //Se carga antes de mostrar la pantalla
    super.initState();
    cargarDatos();
  }

  void cargarDatos() async {
    var datos = await ApiServicios.ObtenerCarreras();
    setState(() {
      usuarios = datos;
      //print(usuarios);
    });
  }

  void modificar(int id, String nombre, String password) async {
    TextEditingController NewUsername = TextEditingController();
    TextEditingController NewPassword = TextEditingController();
    String user = nombre;
    String pass = password;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Modificar Usuario"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: NewUsername,
                  decoration: InputDecoration(hintText: "Nuevo usuario"),
                ),
                TextField(
                  controller: NewPassword,
                  decoration: InputDecoration(hintText: "Nueva contraseña"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (NewUsername.text.isEmpty) {
                  NewUsername.text = user;
                }
                if (NewPassword.text.isEmpty) {
                  NewPassword.text = pass;
                }
                //await ApiServicios.modificar(id,NewUsername.text,NewPassword.text);
                cargarDatos();
                Navigator.pop(context);
              },
              child: Text("Guardar"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }

  void AgregarUsuario() async {
    String n = nombre.text;
    String p = password.text;
    if (n.isNotEmpty && p.isNotEmpty) {
      //var res = await ApiServicios.insertar(n, p);
      //setState(() => resultado = res);
      Navigator.pop(context);
      cargarDatos();
      nombre.clear();
      password.clear();
      MostrarDialog("Usuario agregado", "El usuario ha sido agregado");
    } else {
      MostrarDialog("Error al guardar", "Faltan datos");
    }
  }

  void Agregar() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Usuario"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nombre,
                  decoration: InputDecoration(hintText: "Nuevo usuario"),
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(hintText: "Nueva contraseña"),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            ElevatedButton(onPressed: AgregarUsuario, child: Text("Agregar")),
          ],
        );
      },
    );
  }

  void MostrarDialog(String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('$titulo'),
          content: Text('$mensaje'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: usuarios.isEmpty
          ? Center(
              //child:CircularProgressIndicator(),
              child: Text(
                "No hay carreras registradas",
                //style: TextStyle(color: Colors.red),),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'xkcd',
                  color: const Color.fromARGB(255, 204, 39, 28),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          : ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                var u = usuarios[index];
                return Card(
                  child: ListTile(
                    title: Text(u[1]),
                    subtitle: Text("id: ${u[0]}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () async {
                            //await ApiServicios.eliminar(int.parse(u[0]));
                            cargarDatos();
                          },
                          icon: Icon(Icons.delete),
                        ),

                        IconButton(
                          onPressed: () async {
                            modificar(int.parse(u[0]), u[1], u[2]);
                            cargarDatos();
                          },
                          icon: Icon(Icons.update),
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
        backgroundColor: const Color.fromARGB(255, 11, 183, 213),
        child: Icon(Icons.add),
      ),
    );
  }
}
