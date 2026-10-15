import 'package:http/http.dart' as http;

class ApiServicios {
  static const String BaseUrl = "http://10.0.2.2:8000";

  static Future mostrarAnimales() async {
    var url = Uri.parse("$BaseUrl/mostrarAnimales.php");
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  static Future insertarAnimales(
    String nombre,
    String raza,
    String anio,
    String descripcion,
  ) async {
    var url = Uri.parse(
      "$BaseUrl/insertarAnimales.php?nombre=$nombre&raza=$raza&anio=$anio&descripcion=$descripcion",
    );
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  static Future insertarClasificacion(String nombre, String descripcion) async {
    var url = Uri.parse(
      "$BaseUrl/insertarClasificacion.php?nombre=$nombre&descripcion=$descripcion",
    );
    var respuesta = await http.get(url);
    return respuesta.body;
  }
}
