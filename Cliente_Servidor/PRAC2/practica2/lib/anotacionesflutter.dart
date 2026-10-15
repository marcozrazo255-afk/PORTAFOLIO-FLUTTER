

//estructura basica para main sin etiqueta

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Login());
  }
}



//Estructura basica para una pagina con titulo 

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return banco();
  }
}

class banco extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 4, 159, 255),
      ),
      body: Center(),
    );
  }
}


import 'package:flutter/material.dart';

class Banco extends StatefulWidget {
  const Banco({super.key});

  @override
  State<StatefulWidget> createState() {
    return banco();
  }
}

class banco extends State<Banco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banco"),
        backgroundColor: const Color.fromARGB(255, 4, 117, 255),
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
                    'Banco',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20), // Espaciador
                  // 3. ESTRUCTURA BÁSICA DE UN BOTÓN REDONDO Y COMPACTO
                  ElevatedButton(
                    onPressed: () {
                      // Aquí va la lógica/acción del botón
                    },
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
                      'Retirar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí va la lógica/acción del botón
                    },
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
                      'Abonar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 24), // Espaciador antes de la lista
                  // LE AGREGAMOS ESTE SIZEDBOX PARA HACER VISIBLE LA LISTA
                  SizedBox(
                    height:
                        200, // <--- Limita la altura de la lista para que no rompa el diseño
                    child: ListView.builder(
                      shrinkWrap:
                          true, // Ayuda a que la lista se adapte al espacio asignado
                      itemCount: 10, // Cantidad de elementos en la lista
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.star,
                          ), // Icono o elemento a la izquierda
                          title: Text(
                            'Elemento ${index + 1}',
                          ), // Texto principal (Título)
                          subtitle: const Text(
                            'Descripción',
                          ), // Texto secundario (Subtítulo)
                          trailing: const Icon(
                            Icons.arrow_right,
                          ), // Icono o botón a la derecha
                          onTap: () {
                            // Qué pasa al hacer clic en este renglón
                          },
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

import 'package:flutter/material.dart';

class ContenedorPrincipal extends StatefulWidget {
  const ContenedorPrincipal({super.key});

  @override
  State<ContenedorPrincipal> createState() => _ContenedorPrincipalState();
}

class _ContenedorPrincipalState extends State<ContenedorPrincipal> {
  // 1. Variable para saber qué pestaña de abajo está activa
  int _indiceActual = 0;

  // 2. Lista de las ventanas que se van a mostrar al presionar los botones
  final List<Widget> _ventanas = [
    const Center(child: Text("Ventana Inicio / Login", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Ventana Operaciones Banco", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Ventana Ajustes / Config", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi App con Botones Abajo"),
        backgroundColor: Colors.blue,
      ),
      
      // 3. El body cambia de pantalla dinámicamente según el índice del botón
      body: _ventanas[_indiceActual],

      // 4. AQUÍ SE AGREGA LA BARRA DE BOTONES INFERIOR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual, // Le dice qué botón marcar como activo
        onTap: (int indexNuevo) {
          // El truco obligatorio del StatefulWidget para cambiar de pestaña en tiempo real
          setState(() {
            _indiceActual = indexNuevo;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Banco',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}

logica de una lista con botones de modificar, eliminar y insertar

/import 'package:flutter/material.dart';
// 1. IMPORTACIONES OBLIGATORIAS
import 'api_servicios.dart'; 

class PaginaEjemplo extends StatefulWidget {
  const PaginaEjemplo({super.key});

  @override
  State<PaginaEjemplo> createState() => _PaginaEjemploState();
}

class _PaginaEjemploState extends State<PaginaEjemplo> {
  // Lista local para pintar en pantalla lo que traigamos de la Base de Datos
  List<dynamic> _elementos = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarDatosDesdeMySQL(); // Al abrir la pantalla, descarga los datos de la BD
  }

  // FUNCIÓN PARA REFRESCAR LA LISTA DESDE MYSQL
  Future<void> _cargarDatosDesdeMySQL() async {
    try {
      // Supongamos que jala los datos del usuario "1"
      var datos = await ApiServicios.obtenerUsuario("1"); 
      setState(() {
        _elementos = datos;
        _cargando = false;
      });
    } catch (e) {
      setState(() => _cargando = false);
      print("Error al cargar datos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Control de MySQL"),
        backgroundColor: Colors.blue,
      ),

      // Si el internet está lento, muestra un círculo de carga
      body: _cargando 
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _elementos.length,
            itemBuilder: (context, index) {
              final item = _elementos[index];

              return ListTile(
                leading: CircleAvatar(child: Text(item['id_movimiento'].toString())), 
                title: Text("Saldo: \$${item['saldo']}"),
                
                trailing: Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    
                    // ==========================================
                    // LÓGICA REAL: MODIFICAR / EDITAR
                    // ==========================================
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.orange),
                      onPressed: () async {
                        // Enviamos el ID y el nuevo monto simulado de 1500 a modificarSaldo.php
                        String res = await ApiServicios.modificarSaldo(item['id_usuario'].toString(), 1500.0, "modificar");
                        print("Respuesta servidor: $res");
                        
                        // Si la base de datos aceptó el cambio, refrescamos la pantalla
                        _cargarDatosDesdeMySQL(); 
                      },
                    ),

                    // ==========================================
                    // LÓGICA REAL: ELIMINAR
                    // ==========================================
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        // Nota: Si creas un script eliminar.php, llamarías a: ApiServicios.eliminar(id);
                        // Aquí simularemos el flujo usando tu API existente pasando monto 0
                        String res = await ApiServicios.modificarSaldo(item['id_usuario'].toString(), 0.0, "eliminar");
                        print("Respuesta servidor: $res");

                        // Refrescamos la pantalla para ver el cambio reflejado de MySQL
                        _cargarDatosDesdeMySQL(); 
                      },
                    ),
                  ],
                ),
              );
            },
          ),

      // ==========================================
      // LÓGICA REAL: INSERTAR (Botón '+' abajo a la derecha)
      // ==========================================
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Llama a tu archivo insertarSaldo.php pasándole el usuario 1 y un monto de 500
          String res = await ApiServicios.insertarSaldo("1", 500.0);
          print("Respuesta servidor: $res");

          // Refresca la lista de Flutter descargando el nuevo renglón desde MySQL
          _cargarDatosDesdeMySQL(); 
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
