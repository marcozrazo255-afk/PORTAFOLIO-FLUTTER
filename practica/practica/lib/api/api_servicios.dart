import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServicios {
  static const String BaseUrl = "http://10.0.2.2:8000";

  static Future<String> login(String nip) async {
    var url = Uri.parse("$BaseUrl/login.php?nip=$nip");
    var respuesta = await http.get(url);
    return respuesta.body; // Devuelve "Acceso correcto,id" o "NIP incorrecto"
  }

  // 2. INSERTAR SALDO (CREAR REGISTRO)
  static Future<String> insertarSaldo(String idUsuario, double monto) async {
    // Asegúrate de que el nombre del archivo PHP sea idéntico al tuyo
    var url = Uri.parse(
      "$BaseUrl/insertarSaldo.php?id_usuario=$idUsuario&monto=$monto",
    );
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  // 3. MODIFICAR SALDO (RETIRAR O ABONAR)
  static Future<String> modificarSaldo(
    String idUsuario,
    double monto,
    String tipoOperacion,
  ) async {
    // Nota: "tipoOperacion" puede servirte en PHP para saber si es 'retirar' o 'abonar'
    var url = Uri.parse(
      "$BaseUrl/modificarSaldo.php?id_usuario=$idUsuario&monto=$monto&tipo=$tipoOperacion",
    );
    var respuesta = await http.get(url);
    return respuesta.body;
  }

  // 4. OBTENER USUARIO / CONSULTAR DATOS
  static Future<dynamic> obtenerUsuario(String idUsuario) async {
    var url = Uri.parse("$BaseUrl/obtenerUsuario.php?id_usuario=$idUsuario");
    var respuesta = await http.get(url);
    return json.decode(
      respuesta.body,
    ); // Devuelve el JSON con los datos del usuario
  }
}
