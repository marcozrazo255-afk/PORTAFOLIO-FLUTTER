import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  final String usuario;
  const Pagina2({super.key, required this.usuario});
  @override
  State<StatefulWidget> createState() {
    return Clase2();
  }
}

class Clase2 extends State<Pagina2> {
  final _llave = GlobalKey<FormState>();
  final TextEditingController nombre = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController telefono = TextEditingController();
  final TextEditingController correo = TextEditingController();

  late String cad;
  @override
  void initState() {
    super.initState();
    cad = "Usuairo ${widget.usuario}";
  }

  String? _validarNombre(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe un nombre';
    }
    final exp = RegExp(r'^[a-zA-Z ]*$');
    if (!exp.hasMatch(value)) {
      return 'Ingresa solo letras';
    }
    return null;
  }

  String? _ValidarEdad(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe una edad';
    }
    final exp = RegExp(r'^[0-9]*$');
    if (!exp.hasMatch(value)) {
      return 'Ingresa solo numeros';
    }
    return null;
  }

  String? _validarTelefono(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe un Telefono';
    }
    if (!(value.length == 10)) {
      return 'El telefono debe ser 10 digitos';
    }
    final exp = RegExp(r'^[0-9]*$');
    if (!exp.hasMatch(value)) {
      return 'Ingresa solo numeros';
    }
    return null;
  }

  String? _validarCorreo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe un correo';
    }
  }

  void Validar() {
    if (_llave.currentState?.validate() ?? false) {
      String n = nombre.text;
      int e = int.tryParse(edad.text) ?? 0;
      int t = int.tryParse(telefono.text) ?? 0;
      String c = correo.text;
      print(n);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Datos incorrectos')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina 2'), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(flex: 1, child: Text(cad, style: TextStyle(fontSize: 24))),
            Expanded(
              flex: 5,
              child: Form(
                key: _llave,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nombre,
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(),
                      ),
                      validator: _validarNombre,
                    ),
                    TextFormField(
                      controller: edad,
                      decoration: const InputDecoration(
                        labelText: 'Edad',
                        border: OutlineInputBorder(),
                      ),
                      validator: _ValidarEdad,
                    ),
                    TextFormField(
                      controller: telefono,
                      decoration: const InputDecoration(
                        labelText: 'Telefono',
                        border: OutlineInputBorder(),
                      ),
                      validator: _validarTelefono,
                    ),
                    TextFormField(
                      controller: correo,
                      decoration: const InputDecoration(
                        labelText: 'Correo',
                        border: OutlineInputBorder(),
                      ),
                      validator: _validarCorreo,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: Validar,
                  child: Text('Aceptar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
