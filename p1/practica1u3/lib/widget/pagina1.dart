import 'package:flutter/material.dart';
import 'package:practica1u3/widget/pagina2.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<StatefulWidget> createState() {
    return Datos();
  }
}

class Datos extends State<Pagina1> {
  final _llave = GlobalKey<FormState>();
  final TextEditingController nombre = TextEditingController();
  final TextEditingController apellidos = TextEditingController();

  void validar() {
    String nom = nombre.text;
    String ape = apellidos.text;
    String cadena = nom + " - " + ape;

    if (_llave.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Pagina2(cadena: cadena)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error')));
    }
  }

  String? _nombre(String? value) {
    if (value == null || value.isEmpty) {
      return "Escribe el nombre";
    }

    String letra = value[0];
    String resto = value.substring(1);

    if (letra != letra.toUpperCase()) {
      return 'La primer letra debe ser mayúscula';
    }

    final minusculas = RegExp(r'^[a-z]+$');
    if (!minusculas.hasMatch(resto)) {
      return "El resto deben ser solo minúsculas";
    }

    return null;
  }

  String? vApellidos(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe el nombre';
    }
    final nom = RegExp(r'^[a-z]+$');
    if (!nom.hasMatch(value)) {
      return 'Error solo minusculas';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Practica 1'), backgroundColor: Colors.lime),
      body: Form(
        key: _llave,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Card(
                elevation: 15,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nombre'),
                        controller: nombre,
                        validator: _nombre,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Apellidos'),
                        controller: apellidos,
                        validator: vApellidos,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.lightGreenAccent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: validar,
                      child: Text("Aceptar"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
