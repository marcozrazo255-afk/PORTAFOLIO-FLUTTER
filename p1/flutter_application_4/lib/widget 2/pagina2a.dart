import 'package:flutter/material.dart';
import 'pagina3a.dart';

class Pagina2a extends StatefulWidget {
  final String usuario2;
  final String password2;

  const Pagina2a({super.key, required this.usuario2, required this.password2});

  @override
  State<Pagina2a> createState() => _Pagina2aState();
}

class _Pagina2aState extends State<Pagina2a> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2'),
        backgroundColor: Colors.blueGrey,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Usuario: ${widget.usuario2}"),
            Text("Password: ${widget.password2}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pagina3a()),
                );
              },
              child: const Text('Ir a Página 3'),
            ),
          ],
        ),
      ),
    );
  }
}
