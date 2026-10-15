import 'package:http/http.dart' as http;

class ApiServicios {
  static const String Baseurl = "http://10.0.2.2:8000";

  static Future modificarSaldos() async {
    var url = Uri.parse(Baseurl + "/modificarRetiro.php?");
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  Future insertarSaldo(dynamic http, dynamic sal) async {
    var BaseUrl;
    var url = Uri.parse("$BaseUrl/insertarSaldo.php?saldo=$sal");
    var respuesta = await http.get(url);
    return respuesta.body;
  }
}
