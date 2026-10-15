import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Disenio();
  }
}

class Disenio extends State<Formulario> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final _formkey = GlobalKey<FormState>(); //Deteta acciones al querer validar

  String? aplicarValidacion(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Ingresa un dato';
    }
    final exp = RegExp(r'^[a-z, A-Z ]*$');
    if (!exp.hasMatch(valor)) {
      return 'Ingresa solo letras';
    }
    return null;
  }

  void validarDatos() {
    if (_formkey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Dato correcto')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
        backgroundColor: const Color.fromARGB(255, 17, 254, 8),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Form(
          key: _formkey, //detecta la llave
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[a-z, A-Z ]*$')),
                ],
                controller: num1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Escribe un nombre',
                  border: OutlineInputBorder(),
                ),
              ),

              TextFormField(
                controller: num2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Escribe otro nombre',
                  border: OutlineInputBorder(),
                ),
                validator: aplicarValidacion,
              ),
              SizedBox(height: 10),
              SizedBox(
                child: ElevatedButton.icon(
                  onPressed: validarDatos,
                  label: Text('Validar'),
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
