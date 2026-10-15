import 'package:flutter/material.dart';
import 'package:practica/api/api_servicios.dart';

// Clase encargada de registrar el Widget en el sistema de Flutter
class Banco extends StatefulWidget {
  const Banco({super.key});

  @override
  State<StatefulWidget> createState() {
    return banco(); // Enlaza este widget con su estado lógico de abajo
  }
}

class banco extends State<Banco> {
  // Controlador para capturar las teclas que el usuario pulsa en la caja de texto
  final TextEditingController _montoController = TextEditingController();

  // Controla matemáticamente cuánto dinero le queda al usuario en la sesión actual
  double _saldoActual = 1000.0;

  // Lista de mapas que guarda temporalmente el historial para pintarlo en la pantalla
  final List<Map<String, String>> _transacciones = [
    {
      'tipo': 'Abono',
      'monto': '\$ 1,000.00',
      'detalle': 'Saldo inicial disponible',
    },
  ];

  // Recibe el 'context' (saber en qué pantalla pararse) y el texto a mostrar
  void mostrarError(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          mensaje,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  //Este método se ejecuta al pulsar "Retirar" o "Abonar". Dibuja el cuadro con la caja de texto.
  void mostrarAlerta(BuildContext context, String operacion) {
    showDialog(
      context: context,
      barrierDismissible: false, // Bloquea los clics fuera del cuadro
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text('Operación: ${operacion.toUpperCase()}'),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Hace que el diálogo sea compacto
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Saldo disponible: \$ ${_saldoActual.toStringAsFixed(2)}'),
              const SizedBox(height: 10),
              Text('Ingresa la cantidad a $operacion:'),
              const SizedBox(height: 12),
              TextField(
                controller:
                    _montoController, // Enlace para rescatar el texto tecleado
                keyboardType:
                    TextInputType.number, // Despliega teclado numérico
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            // BOTÓN CANCELAR: Solo borra el texto y cierra el cuadro emergente
            TextButton(
              onPressed: () {
                _montoController.clear();
                Navigator.of(context).pop(); // Esconde el AlertDialog
              },
              child: const Text('CANCELAR'),
            ),
            // BOTÓN CONFIRMAR: Ejecuta la validación y guarda en el servidor PHP
            ElevatedButton(
              onPressed: () async {
                // 'async' es obligatorio para esperar al internet

                // <-- Agregamos async para la respuesta de internet
                String montoEscrito = _montoController.text;

                if (montoEscrito.isNotEmpty) {
                  // Convierte el texto a formato número decimal, si falla pone 0.0
                  double monto = double.tryParse(montoEscrito) ?? 0.0;

                  // Filtro: Evita números negativos o ceros
                  if (monto <= 0) {
                    mostrarError(context, "Ingresa una cantidad mayor a 0");
                    return;
                  }

                  // Filtro de Incongruencia: Evita que retires más de lo que posees
                  if (operacion == 'retirar' && monto > _saldoActual) {
                    Navigator.of(context).pop();
                    mostrarError(context, "Saldo insuficiente.");
                    _montoController.clear();
                    return;
                  }

                  // Lógica matemática: Calcula el resultado final antes de enviarlo
                  double nuevoSaldo = operacion == 'retirar'
                      ? _saldoActual - monto
                      : _saldoActual + monto;

                  try {
                    // PETICIÓN HTTP: Envía el ID del usuario y el saldo calculado a insertarSaldo.php
                    String respuestaApi = await ApiServicios.insertarSaldo(
                      "1",
                      nuevoSaldo,
                    );
                    print("Respuesta Base de Datos: $respuestaApi");

                    // REFRESH VISUAL: Si la API no falló, se actualiza la app en tiempo real
                    setState(() {
                      _saldoActual = nuevoSaldo;

                      /// Reescribe el saldo de la pantalla

                      // Agrega el renglón al inicio del historial local
                      _transacciones.insert(0, {
                        'tipo': operacion == 'retirar' ? 'Retiro' : 'Abono',
                        'monto': '\$ ${monto.toStringAsFixed(2)}',
                        'detalle': 'Confirmado en Base de Datos',
                      });
                    });
                    // Captura errores si el servidor PHP está apagado o no hay Wi-Fi
                  } catch (e) {
                    mostrarError(
                      context,
                      "Error de red: No se pudo guardar el movimiento.",
                    );
                  }

                  _montoController
                      .clear(); // Limpia la caja para la próxima vez
                  Navigator.of(context).pop(); // Esconde el cuadro de diálogo
                }
              },
              child: const Text('CONFIRMAR'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banco"),
        backgroundColor: const Color.fromARGB(255, 4, 117, 255),
      ),
      body: Center(
        child: SizedBox(
          width: 320, // Modera el ancho de la tarjeta en horizontal
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.blue, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Evita el estiramiento vertical infinito
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Texto superior que muestra el saldo de la cuenta con dos decimales
                  Text(
                    'Saldo: \$ ${_saldoActual.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Botón Retirar: Abre el diálogo pasándole la etiqueta 'retirar'
                  ElevatedButton(
                    onPressed: () => mostrarAlerta(context, 'retirar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(), // Botón ovalado / redondo
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Retirar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Botón Abonar: Abre el diálogo pasándole la etiqueta 'abonar'
                  ElevatedButton(
                    onPressed: () => mostrarAlerta(context, 'abonar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Abonar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Contenedor rígido para que la lista no rompa el Scaffold
                  SizedBox(
                    height:
                        200, // Altura límite asignada para el scroll de la lista
                    child: ListView.builder(
                      shrinkWrap:
                          true, // Acopla la lista al tamaño de los elementos internos
                      itemCount: _transacciones
                          .length, // Renglones dinámicos según el arreglo
                      itemBuilder: (context, index) {
                        final movimiento = _transacciones[index];
                        final esRetiro = movimiento['tipo'] == 'Retiro';
                        // Diseña de forma repetitiva cada renglón del historial
                        return ListTile(
                          leading: Icon(
                            esRetiro
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                            color: esRetiro ? Colors.red : Colors.green,
                          ), // Rojo = Retiro, Verde = Abono
                          title: Text(
                            '${movimiento['tipo']} de ${movimiento['monto']}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            movimiento['detalle'] ?? '',
                          ), // Texto aclaratorio inferior
                          trailing: const Icon(Icons.arrow_right),
                        );
                      },
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
