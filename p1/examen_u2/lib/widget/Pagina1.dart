import 'package:examen_u2/widget/Pagina2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => disenio();
}

class disenio extends State<Pagina1> {
  final TextEditingController n1 = TextEditingController();
  final TextEditingController n2 = TextEditingController();
  final TextEditingController n3 = TextEditingController();

  String resultado = "";
  String MensajeError = "";

  bool validacion(String valor) {
    return RegExp(r'^[A-Z][a-zA-Z\s]*$').hasMatch(valor);
  }

  void hola() {
    final String nom1 = n1.text.trim();
    final String nom2 = n2.text.trim();
    final String nom3 = n3.text.trim();
    if (nom1.isEmpty || nom2.isEmpty || nom3.isEmpty) {
      setState(() {
        MensajeError = 'Todos los campos deben de estar llenos';
        resultado = '';
      });
      return;
    }
    if (!validacion(nom1) || !validacion(nom2) || !validacion(nom3)) {
      setState(() {
        MensajeError =
            'Solo se permiten nombres con la primera letra masyucula';
        resultado = '';
      });
      return;
    }
    setState(() {
      resultado = '$nom1 $nom2 $nom3';
      MensajeError = '';
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pagina2(
            nombreCompleto: nom1,
            apellidoPaterno: nom2,
            apellidoMaterno: nom3,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Datos"), backgroundColor: Colors.lightBlue),
      body: Padding(
        padding: EdgeInsetsGeometry.all(30),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: n1,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[a-z, A-Z ]*$')),
                ],
                decoration: InputDecoration(
                  labelText: "Escribe un nombre",
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: n2,
                decoration: InputDecoration(
                  labelText: "Escribe apellido paterno",
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: n3,
                decoration: InputDecoration(
                  labelText: "Escribe apellido Materno",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 70),
              Text(
                MensajeError,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 70),
              SizedBox(
                child: ElevatedButton.icon(
                  onPressed: hola,
                  label: Text("validar"),
                  icon: Icon(Icons.verified),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
