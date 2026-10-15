import 'package:flutter/material.dart';
import 'package:repaso/widget/Pagina2.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Pagina1State();
  }
}

class _Pagina1State extends State<Pagina1> {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController password = TextEditingController();

  void validar() {
    String u = usuario.text;
    String p = password.text;

    if (u.isNotEmpty && p.isNotEmpty) {
      if (u == 'admin' && p == '12345') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Pagina2(usuario: u)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario o contraseña incorrectos')),
        );
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Datos vacíos')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 5'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/usuario.png'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: usuario,
                    decoration: const InputDecoration(
                      labelText: 'Usuario',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: validar,
                      child: const Text('Aceptar'),
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
