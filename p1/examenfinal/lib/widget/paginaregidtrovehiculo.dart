import 'package:examenfinal/basedatos/basedatoshelper.dart';
import 'package:flutter/material.dart';

class PaginaRegistroVehiculo extends StatefulWidget {
  const PaginaRegistroVehiculo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PaginaRegistroVehiculoState();
  }
}

class _PaginaRegistroVehiculoState extends State<PaginaRegistroVehiculo> {
  final _formKey = GlobalKey<FormState>();

  String formato(String marca, String modelo) {
    final primera = marca.isNotEmpty ? marca[0] : '';
    final ultima = marca.isNotEmpty ? marca[marca.length - 1] : '';
    final ultimosDos = modelo.length >= 2
        ? modelo.substring(modelo.length - 2)
        : modelo;
    return '$primera$ultima-$ultimosDos';
  }

  final TextEditingController nombre = TextEditingController();
  final TextEditingController modelo = TextEditingController();
  final TextEditingController precio = TextEditingController();

  void validar() async {
    if (_formKey.currentState!.validate()) {
      String n = nombre.text;
      String m = modelo.text;
      String p = precio.text;

      String codigo = formato(n, m);

      await Basedatoshelper().insertarVehiculo(codigo, n, m, p);
      print("Registrado con código: $codigo");

      nombre.clear();
      modelo.clear();
      precio.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vehículos guardados correctamente")),
      );
    } else {
      print("Formulario inválido");
    }
  }

  String? vnombre(String? valor) {
    if (valor == null || valor.isEmpty) return "Campo vacío";
    RegExp exp = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚ\s]+$');
    if (!exp.hasMatch(valor)) return "Debe contener solo letras";
    return null;
  }

  String? vmarca(String? valor) {
    if (valor == null || valor.isEmpty) return "Campo vacío";
    RegExp exp = RegExp(r'^[0-9]{4}$');
    if (!exp.hasMatch(valor)) return "Debe contener exactamente 4 dígitos";
    return null;
  }

  String? vprecio(String? valor) {
    if (valor == null || valor.isEmpty) return "Campo vacío";
    RegExp exp = RegExp(r'^[0-9]{6}$');
    if (!exp.hasMatch(valor)) return "Debe contener 6 digitos números";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrar Vehículo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Datos del Vehículo",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: nombre,
                    decoration: const InputDecoration(
                      labelText: "Nombre del Vehículo",
                      border: OutlineInputBorder(),
                    ),
                    validator: vnombre,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: modelo,
                    decoration: const InputDecoration(
                      labelText: "Modelo y/o año",
                      border: OutlineInputBorder(),
                    ),
                    validator: vmarca,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: precio,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Precio",
                      border: OutlineInputBorder(),
                    ),
                    validator: vprecio,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: validar,
                    child: const Text("Guardar Vehículo"),
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





import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<StatefulWidget> createState() {
    return Class();
  }
}

void validar() async {}

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
    RegExp exp = RegExp(r'^[0-9]{3}$');
    if (!exp.hasMatch(valor)) return "Debe contener exactamente 4 dígitos";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
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
              child: Column(
                key: _formKey,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nombre,
                    decoration: InputDecoration(
                      labelText: "Escribe tu nombre",
                      border: OutlineInputBorder(),
                    ),
                    validator: vnombre,
                  ),
                  TextFormField(
                    controller: nip,
                    decoration: InputDecoration(
                      labelText: "Escribe tu nip",
                      border: OutlineInputBorder(),
                    ),
                    validator: vnip,
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text('Agregar'),
                      icon: Icon(Icons.verified),
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
