import 'package:flutter/material.dart';
import 'pagina2.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<StatefulWidget> createState() {
    return Class();
  }
}

class Class extends State<Pagina1> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nombre = TextEditingController();
  final TextEditingController nip = TextEditingController();

  String? vnombre(String? valor) {
    if (valor == null || valor.isEmpty) return "Campo vacío";
    RegExp exp = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚ\s]+$');
    if (!exp.hasMatch(valor)) return "Debe contener solo letras";
    return null;
  }

  String? vnip(String? valor) {
    if (valor == null || valor.isEmpty) return "Campo vacío";
    RegExp exp = RegExp(r'^[0-9]{3}$'); // exactamente 4 dígitos
    if (!exp.hasMatch(valor)) return "Debe contener exactamente 3 dígitos";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
        backgroundColor: const Color.fromARGB(255, 31, 255, 2),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 4,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nombre,
                      decoration: const InputDecoration(
                        labelText: "Escribe tu nombre",
                        border: OutlineInputBorder(),
                      ),
                      validator: vnombre,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: nip,
                      decoration: const InputDecoration(
                        labelText: "Escribe tu NIP",
                        border: OutlineInputBorder(),
                      ),
                      validator: vnip,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Pagina2(nombre: nombre.text, nip: nip.text),
                              ),
                            );
                          }
                        },
                        label: const Text('Agregar'),
                        icon: const Icon(Icons.verified),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
