import 'package:flutter/material.dart';
import 'package:videojuegos/api/api_servicios.dart';
// Importación con el nombre de tu proyecto real

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  // 1. Controladores para las cajas de texto de los formularios
  TextEditingController nombre = TextEditingController();
  TextEditingController precio = TextEditingController();
  TextEditingController plataforma = TextEditingController();
  TextEditingController idCategorias = TextEditingController();

  // 2. Listas dinámicas que se llenarán con tu backend PHP
  List videojuegos = [];
  List categorias = [];

  String? categoriaSeleccionado;

  // 3. Inicializador del estado de la pantalla
  @override
  void initState() {
    super.initState();
    cargarVideojuegos();
    cargarCategorias();
  }

  // 4. Funciones de comunicación lógica con tu API
  void cargarVideojuegos() async {
    var v = await ApiServicios.datosVideojuegos();
    setState(() {
      videojuegos = v;
    });
  }

  void cargarCategorias() async {
    var c = await ApiServicios.datosCategorias();
    setState(() {
      categorias = c;
    });
  }

  void agregarVideojuegos() async {
    String n = nombre.text;
    String p = precio.text;
    String pl = plataforma.text;

    if (categoriaSeleccionado == null) {
      MostrarDialogs("Error", "Debe seleccionar una categoría");
      return;
    }

    int idC = int.parse(categoriaSeleccionado!);

    if (n.isNotEmpty && p.isNotEmpty && pl.isNotEmpty && idC > 0) {
      var respuesta = await ApiServicios.insertarVideojuegos(n, p, pl, idC);
      setState(() {
        cargarVideojuegos(); // Recarga la lista automáticamente
        nombre.clear();
        precio.clear();
        plataforma.clear();
        idCategorias.clear();
        categoriaSeleccionado = null;
        MostrarDialogs("Respuesta", respuesta);
      });
    } else {
      MostrarDialogs("Error", "Todos los campos son obligatorios");
    }
  }

  // Alerta genérica del sistema
  void MostrarDialogs(String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  // 5. Ventana emergente para AGREGAR un videojuego nuevo
  void Agregar() {
    nombre.clear();
    precio.clear();
    plataforma.clear();
    categoriaSeleccionado = null;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          // Permite actualizar el Dropdown dentro del diálogo
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Agregar Videojuego"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nombre,
                      decoration: const InputDecoration(labelText: "Nombre"),
                    ),
                    TextField(
                      controller: precio,
                      decoration: const InputDecoration(labelText: "Precio"),
                    ),
                    TextField(
                      controller: plataforma,
                      decoration: const InputDecoration(
                        labelText: "Plataforma",
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: categoriaSeleccionado,
                      hint: const Text("Selecciona una Categoría"),
                      items: categorias.map<DropdownMenuItem<String>>((c) {
                        return DropdownMenuItem<String>(
                          value: c[0]
                              .toString(), // Guarda el ID de la categoría (Posición 0)
                          child: Text(
                            c[1].toString(),
                          ), // Muestra el nombre (Posición 1)
                        );
                      }).toList(),
                      onChanged: (value) {
                        setDialogState(() {
                          categoriaSeleccionado = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    agregarVideojuegos();
                  },
                  child: const Text("Agregar"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // 6. Ventana emergente para MODIFICAR un videojuego existente
  void Modificar(dynamic v) {
    // Rellena los controladores con los datos actuales del videojuego seleccionado
    nombre.text = v[1].toString();
    precio.text = v[2].toString();
    plataforma.text = v[3].toString();
    categoriaSeleccionado = v[4].toString(); // ID de la categoría asociada

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Modificar Videojuego"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nombre,
                      decoration: const InputDecoration(labelText: "Nombre"),
                    ),
                    TextField(
                      controller: precio,
                      decoration: const InputDecoration(labelText: "Precio"),
                    ),
                    TextField(
                      controller: plataforma,
                      decoration: const InputDecoration(
                        labelText: "Plataforma",
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: categoriaSeleccionado,
                      hint: const Text("Selecciona una Categoría"),
                      items: categorias.map<DropdownMenuItem<String>>((c) {
                        return DropdownMenuItem<String>(
                          value: c[0].toString(),
                          child: Text(c[1].toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setDialogState(() {
                          categoriaSeleccionado = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (nombre.text.isEmpty ||
                        precio.text.isEmpty ||
                        plataforma.text.isEmpty ||
                        categoriaSeleccionado == null) {
                      MostrarDialogs(
                        "Error",
                        "Todos los campos son obligatorios",
                      );
                      return;
                    }
                    Navigator.pop(context);

                    // Llama a la función de modificar pasándole el ID único del juego (v[0])
                    var respuesta = await ApiServicios.modificarVideojuegos(
                      int.parse(v[0].toString()),
                      nombre.text,
                      precio.text,
                      plataforma.text,
                      int.parse(categoriaSeleccionado!),
                    );

                    cargarVideojuegos(); // Recarga la lista
                    MostrarDialogs("Respuesta", respuesta);
                  },
                  child: const Text("Guardar Cambios"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // 7. Renderizado Visual del Entorno de Registro
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro de Videojuegos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),

      body: videojuegos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: videojuegos.length,
              itemBuilder: (context, index) {
                var v = videojuegos[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ListTile(
                    title: Text(
                      "Nombre: \${v[1]}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text("Precio: \${v[2]}"),
                        Text("Plataforma: \${v[3]}"),
                        Text("Categoría: \${v[4]}"),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => Modificar(
                            v,
                          ), // Abre ventana de edición con los datos de este juego
                          icon: const Icon(Icons.edit, color: Colors.blue),
                        ),
                        IconButton(
                          onPressed: () async {
                            var respuesta =
                                await ApiServicios.eliminarVideojuegos(
                                  int.parse(v[0].toString()),
                                );
                            cargarVideojuegos(); // Recarga la lista tras eliminar
                            MostrarDialogs("Eliminado", respuesta);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: Agregar,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
