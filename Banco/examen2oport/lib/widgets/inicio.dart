import 'package:examen2oport/widgets/saldo.dart';
import 'package:flutter/material.dart';

class inicio extends StatefulWidget {
  const inicio({super.key});

  @override
  State<inicio> createState() => _InicioState();
}

class _InicioState extends State<inicio> {
  final TextEditingController nipController = TextEditingController();

  final String nipCorrecto = "2026";

  void mostrarError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje), backgroundColor: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: const Color.fromARGB(255, 180, 243, 243),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nipController,

                maxLength: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingresa tu NIP',

                  counterText: "",
                ),
              ),
              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  if (nipController.text == nipCorrecto) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Saldo(nipRecibido: nipController.text),
                      ),
                    );
                  } else {
                    mostrarError("NIP Incorrecto");
                  }
                },
                child: const Text('Saldo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
