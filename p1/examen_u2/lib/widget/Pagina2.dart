import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Pagina2 extends StatefulWidget {
  final String nombreCompleto;
  final String apellidoPaterno;
  final String apellidoMaterno;

  const Pagina2({
    super.key,
    required this.nombreCompleto,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
  });

  @override
  State<Pagina2> createState() => hello();
}

class hello extends State<Pagina2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datos de la página anterior"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '¡Hola, ${widget.nombreCompleto}!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Apellido paterno:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(widget.apellidoPaterno, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(
              'Apellido materno:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(widget.apellidoMaterno, style: TextStyle(fontSize: 20)),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
                label: Text("Volver"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
