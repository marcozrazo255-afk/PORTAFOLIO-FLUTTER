import 'package:flutter/material.dart';
import 'package:practica1_u3/servicios/api_servicios.dart';
import 'package:practica1_u3/widget/Mostrar.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<Pagina1> {
  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController id = TextEditingController();

  String resultado = "";

  void guardarUsuario() async {
    String u = usuario.text;
    String p = password.text;

    if (u.isNotEmpty && p.isNotEmpty) {
      var res = await ApiServicios.insertar(u, p);
      setState(() => resultado = res);

      // Limpiar campos después de guardar
      usuario.clear();
      password.clear();
    } else {
      print("Faltan datos");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Faltan datos. Por favor completa todos los campos."),
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
  }

  void Eliminar() async {
    String i = id.text;

    if (i.isNotEmpty) {
      int idVal = int.tryParse(i) ?? 0;
      var res = await ApiServicios.eliminar(idVal);
      setState(() => resultado = res);

      id.clear();
    } else {
      print("Faltan datos");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Faltan datos. Debes ingresar un ID."),
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
  }

  void Modificar() async {
    String i = id.text;
    String u = usuario.text;
    String p = password.text;

    if (u.isNotEmpty && p.isNotEmpty && i.isNotEmpty) {
      int idVal = int.tryParse(i) ?? 0;
      var res = await ApiServicios.Modificar(idVal, u, p);
      setState(() => resultado = res);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuario modificado correctamente")),
      );

      // Limpiar campos
      id.clear();
      usuario.clear();
      password.clear();
    } else {
      print("Faltan datos");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Faltan datos. Completa ID, Usuario y Password."),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        backgroundColor: const Color.fromARGB(255, 180, 243, 243),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 197, 233, 216),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: id,
                    style: const TextStyle(fontStyle: FontStyle.normal),
                    decoration: const InputDecoration(labelText: 'ID'),
                  ),
                  TextField(
                    controller: usuario,
                    style: const TextStyle(fontStyle: FontStyle.normal),
                    decoration: const InputDecoration(labelText: 'Usuario'),
                  ),
                  const SizedBox(height: 3),
                  TextField(
                    controller: password,
                    style: const TextStyle(fontStyle: FontStyle.normal),
                    decoration: const InputDecoration(labelText: 'password'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: guardarUsuario,
                            child: const Text('Guardar'),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: Modificar,
                            child: const Text('Modificar'),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: Eliminar,
                            child: const Text('Eliminar'),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MostrarUsuarios(),
                                ),
                              );
                            },
                            child: Text('Mostrar'),
                          ),
                        ),
                        Text(resultado),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
