import 'package:flutter/material.dart';
import 'package:practica/vistas/banco.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return banco();
  }
}

class banco extends State<Login> {
  final TextEditingController nip = TextEditingController();

  void mostrarError(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          mensaje,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 3), // Duración en pantalla
        behavior: SnackBarBehavior.floating, // Hace que flote sobre el diseño
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 4, 159, 255),
      ),

      body: Center(
        child: SizedBox(
          width: 320, // Controla el ancho de toda la tarjeta
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: Colors.blue,
                width: 2,
              ), // Borde de la tarjeta
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0), // Espacio interno ideal
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Evita que la tarjeta se estire hacia abajo
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Centra los elementos internamente
                children: [
                  // 1. ESTRUCTURA BÁSICA DE UN TÍTULO
                  const Text(
                    'NIP',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20), // Espaciador
                  // 2. ESTRUCTURA BÁSICA DE UNA CAJA DE TEXTO (TEXTFIELD)
                  TextField(
                    controller: nip,
                    decoration: InputDecoration(
                      // Borde cuando la caja NO está seleccionada
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      // Borde cuando el usuario hace CLIC para escribir
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24), // Espaciador
                  // 3. ESTRUCTURA BÁSICA DE UN BOTÓN REDONDO Y COMPACTO
                  ElevatedButton(
                    onPressed: () {
                      if (nip.text == "2026") {
                        print("Acceso correcto con 2026");

                        // CAMBIA "const banco()" POR EL NOMBRE DE TU OTRA CLASE:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Banco(), // <-- Aquí va el nombre de tu segunda ventana
                          ),
                        );
                      } else {
                        // 3. Si pone cualquier otra cosa, manda el error con el SnackBar
                        mostrarError(
                          context,
                          "El NIP ingresado es incorrecto. Inténtalo de nuevo.",
                        );
                        nip.clear(); // Limpia la caja de texto
                      }
                    },

                    // Aquí va la lógica/acción del botón
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Color de fondo
                      foregroundColor: Colors.white, // Color del texto
                      shape:
                          const StadiumBorder(), // Hace el botón redondo automáticamente
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Aceptar',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
