import 'package:examenu2_/widget/pagina2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => disenio();
}

class disenio extends State<Pagina1> {
  final TextEditingController DiezoCincoDigitos = TextEditingController();
  final TextEditingController sexoFoM = TextEditingController();
  final TextEditingController nombre = TextEditingController();
  final _llave = GlobalKey<FormState>();
  String resultadoNombre = '';

  void validar() {
    String dig = DiezoCincoDigitos.text;
    String sex = sexoFoM.text;
    String nom = nombre.text;
    String cadena = dig + sex + nom;
    if (_llave.currentState?.validate() ?? false) {
      String cadena =
          '${nombre.text} - ${sexoFoM.text} - ${DiezoCincoDigitos.text}';

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

  String? vDigitos(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe un número';
    }
    final soloNumeros = RegExp(r'^\d{5,10}$');
    if (!soloNumeros.hasMatch(value)) {
      return 'Debe contener entre 5 y 10 dígitos numéricos';
    }
    return null;
  }

  String? vSexo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe el género';
    }

    final sexov = RegExp(r'^[FfMm]$');
    if (!sexov.hasMatch(value)) {
      return 'Solo se permite F o M';
    }

    return null;
  }

  String? validarNombre(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe el nombre';
    }

    String primera = value[0];
    String resto = value.substring(1);

    final soloMinusculas = RegExp(r'^[a-z]+$');
    if (primera != primera.toUpperCase()) {
      return 'La primera letra debe ser mayúscula';
    }
    if (!soloMinusculas.hasMatch(resto)) {
      return 'El resto del nombre debe estar en minúsculas';
    }
    return null;
  }

  String? vNombre(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe el nombre';
    }
    String May = value[0];
    String min = value.substring(1);

    final soloMinusculas = RegExp(r'^[a-z]+$');
    if (May != May.toUpperCase()) {
      return 'La primera letra debe ser mayúscula';
    }
    if (!soloMinusculas.hasMatch(min)) {
      return 'El resto del nombre debe estar en minúsculas';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina principal"),
        backgroundColor: const Color.fromARGB(255, 2, 244, 147),
      ),
      body: Form(
        key: _llave,
        child: Container(
          color: const Color.fromARGB(255, 197, 235, 198),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisclignment: MainAxisAlignment.spaceBetween,
            children: [
              // Sección 1: número y sexo
              Column(
                children: [
                  TextFormField(
                    controller: DiezoCincoDigitos,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'\d')),
                    ],
                    decoration: InputDecoration(
                      labelText: "Escribe el número del 5-10 dígitos",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 152, 230, 57),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 152, 230, 57),
                          width: 2.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: vDigitos,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: sexoFoM,
                    decoration: InputDecoration(
                      labelText: "Escribe el Sexo F/M",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 152, 230, 57),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 152, 230, 57),
                          width: 2.5,
                        ),

                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: vSexo,
                  ),
                ],
              ),

              // Sección 2: botón y texto
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_llave.currentState!.validate()) {
                          setState(() {
                            resultadoNombre =
                                'Número: ${DiezoCincoDigitos.text}, Género: ${sexoFoM.text}, Nombre: ${nombre.text}';
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 96, 248, 152),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      icon: Icon(Icons.done, color: Colors.black),
                      label: Text(
                        "Aceptar",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Text(
                    resultadoNombre,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // Sección 3: nombre y botón
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nombre,
                    decoration: InputDecoration(
                      labelText: "Escribe el Nombre",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 152, 230, 57),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 152, 230, 57),
                          width: 2.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: vNombre,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(maxWidth: 250),
                    child: ElevatedButton.icon(
                      onPressed: validar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          96,
                          248,
                          152,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      icon: Icon(Icons.verified, color: Colors.black),
                      label: Text(
                        "Validar",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
