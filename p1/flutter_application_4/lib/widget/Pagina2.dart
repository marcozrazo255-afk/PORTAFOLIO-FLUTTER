import 'package:flutter/material.dart';
import 'package:flutter_application_4/widget 2/pagina2a.dart';

	class Pagina2 extends StatefulWidget {
	  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController password = TextEditingController();

  void enviar() {
    final String u = usuario.text;
    final String p = password.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Pagina2a(usuario2: u, password2: p),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 1"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login', style: TextStyle(fontSize: 20)),
            TextField(
              controller: usuario,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: enviar, child: const Text('Aceptar')),
          ],
        ),
      ),
    );
  }
}
