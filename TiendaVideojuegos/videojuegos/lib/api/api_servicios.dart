import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServicios {
  // IP para el emulador de Android Studio
  static const String Baseurl = "http://10.0.2.2:8000";

  // 1. OBTENER VIDEOJUEGOS (Muestra la lista en pantalla)
  static Future datosVideojuegos() async {
    var url = Uri.parse(
      "$Baseurl/obtenerVideojuego.php",
    ); // <-- Cambiado según tu foto
    var respuesta = await http.get(url);
    return json.decode(respuesta.body);
  }

  // 2. OBTENER CATEGORÍAS (Llena las opciones del Dropdown)
  static Future datosCategorias() async {
    var url = Uri.parse(
      "$Baseurl/obtenerCategoria.php",
    ); // <-- Cambiado según tu foto
    var respuesta = await http.get(url);
    return json.decode(respuesta.body);
  }

  // 3. INSERTAR / AGREGAR VIDEOJUEGO (Botón +)
  static Future insertarVideojuegos(
    String n,
    String p,
    String pl,
    int idC,
  ) async {
    var url = Uri.parse(
      "$Baseurl/insertarVideojuego.php?nombre=$n&precio=$p&plataforma=$pl&id_categoria=$idC",
    ); // <-- Cambiado según tu foto
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  // 4. ELIMINAR VIDEOJUEGO (Icono Basura)
  static Future eliminarVideojuegos(int id) async {
    var url = Uri.parse(
      "$Baseurl/eliminarVideojuego.php?id=$id",
    ); // <-- Cambiado según tu foto
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  // 5. MODIFICAR / EDITAR VIDEOJUEGO (Icono Lápiz)
  static Future modificarVideojuegos(
    int id,
    String n,
    String p,
    String pl,
    int idC,
  ) async {
    var url = Uri.parse(
      "$Baseurl/modificarVideojuego.php?id=$id&nombre=$n&precio=$p&plataforma=$pl&id_categoria=$idC",
    ); // <-- Cambiado según tu foto
    var respuesta = await http.get(url);
    return respuesta.body;
  }
}
