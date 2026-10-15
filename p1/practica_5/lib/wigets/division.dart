import 'package:flutter/material.dart';

class Division extends StatefulWidget {
  const Division({super.key});

  @override
  State<Division> createState() => _DivisionState();
}

class _DivisionState extends State<Division> {
  final TextEditingController variable1 = TextEditingController();
  final TextEditingController variable2 = TextEditingController();

  double resultado = 0;
  String mensajeError = '';

  bool validacion(String valor) {
    return RegExp(r'^-?\d+(\.\d+)?$').hasMatch(valor);
  }

  void dividir() {
    final String sum1 = variable1.text.trim();
    final String sum2 = variable2.text.trim();

    if (sum1.isEmpty || sum2.isEmpty) {
      setState(() {
        mensajeError = 'Ambos campos deben estar llenos';
        resultado = 0;
      });
      return;
    }

    if (!validacion(sum1) || !validacion(sum2)) {
      setState(() {
        mensajeError = 'Solo se permiten números válidos';
        resultado = 0;
      });
      return;
    }

    final double num1 = double.parse(sum1);
    final double num2 = double.parse(sum2);

    setState(() {
      resultado = num1 / num2;
      mensajeError = ''; // Limpia el mensaje si todo está bien
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: variable1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: variable2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: dividir, child: Text('Validar')),
            SizedBox(height: 10),
            Text(
              mensajeError,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $resultado',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
