import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<StatefulWidget> createState() {
    return clase();
  }
}

class clase extends State<Pagina1> {
  final _llave = GlobalKey<FormState>();
  TextEditingController nombre = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController telefono = TextEditingController();

  void validar() {}

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

  String? validarnum2(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Ingresa un dato';
    }

    final exp = RegExp(r'^[0-9]+$');

    if (!exp.hasMatch(valor)) {
      return 'Ingresa solo números';
    }

    return null;
  }

  String? validarCorreo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe el correo';
    }

    final correo = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!correo.hasMatch(value)) {
      return 'Correo inválido';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registro de usuario",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 61, 3, 221),
      ),
      body: Padding(
        key: _llave,
        padding: EdgeInsets.all(50),

        child: Center(
          child: Card(
            elevation: 25,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Text(
                      'Datos Personales',
                      style: TextStyle(
                        fontSize: 25,
                        color: const Color.fromARGB(255, 61, 3, 221),
                      ),
                    ),
                    TextFormField(
                      controller: nombre,

                      decoration: InputDecoration(
                        labelText: "Nombre completo",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 121, 121, 121),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 90, 89, 89),
                          ),
                        ),
                      ),
                      validator: _nombre,
                    ),
                    TextFormField(
                      controller: correo,

                      decoration: InputDecoration(
                        labelText: "Correo Electronico",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 90, 89, 89),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      validator: validarCorreo,
                    ),
                    TextFormField(
                      controller: telefono,

                      decoration: InputDecoration(
                        labelText: "Telefono",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      validator: validarnum2,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Genero",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(maxWidth: 250),
                          child: ElevatedButton.icon(
                            onPressed: validar,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 15),
                            ),
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                            label: Text(
                              "Aceptar",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
