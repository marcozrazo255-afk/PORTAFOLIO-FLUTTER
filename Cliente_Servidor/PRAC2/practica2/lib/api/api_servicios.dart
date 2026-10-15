import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServicios {
  static const String BaseUrl = "http://10.0.2.2:8000";

  /*static Future insertar(String usuario, String password) async{
    var url = Uri.parse("$BaseUrl/insertar.php?usuario=$usuario&password=$password");
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  static Future eliminar(int id) async{
    var url = Uri.parse("$BaseUrl/eliminar.php?id=$id");
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  static Future modificar(int id, String usuario, String password) async{
    var url = Uri.parse("$BaseUrl/modificar.php?id=$id&usuario=$usuario&password=$password");
    var respuesta = await http.get(url);
    return respuesta.body;
  }*/

  static Future ObtenerAlumnos() async {
    var url = Uri.parse("$BaseUrl/obteneralumnos.php");
    var respuesta = await http.get(url);
    return json.decode(respuesta.body);
  }

  static Future ObtenerCarreras() async {
    var url = Uri.parse("$BaseUrl/obtenercarreras.php");
    var respuesta = await http.get(url);
    return json.decode(respuesta.body);
  }
}
