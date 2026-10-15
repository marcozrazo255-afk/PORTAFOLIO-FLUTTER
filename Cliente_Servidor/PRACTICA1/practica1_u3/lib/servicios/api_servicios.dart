import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServicios {
  static const String Baseurl = "http://10.0.2.2:8000";

  static Future insertar(String u, String p) async {
    var url = Uri.parse("$Baseurl/insertar.php?usuario=$u&password=$p");
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  static Future eliminar(int id) async {
    var url = Uri.parse("$Baseurl/eliminar.php?id=$id");
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  static Future Modificar(int id, String u, String p) async {
    var url = Uri.parse("$Baseurl/modificar.php?id=$id&usuario=$u&password=$p");
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  static Future Datos() async {
    var url = Uri.parse("$Baseurl/datos.php");
    var respuesta = await http.get(url);
    return json.decode(respuesta.body);
  }
}
