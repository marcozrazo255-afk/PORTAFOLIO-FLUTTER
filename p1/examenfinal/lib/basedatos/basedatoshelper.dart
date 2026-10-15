import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Basedatoshelper {
  static final Basedatoshelper _instance = Basedatoshelper._internal();
  factory Basedatoshelper() => _instance;

  Basedatoshelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'vehiculos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE vehiculos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            codigo TEXT NOT NULL,
            marca TEXT NOT NULL,
            modelo TEXT NOT NULL,
            precio TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertarVehiculo(
    String codigo,
    String marca,
    String modelo,
    String precio,
  ) async {
    final db = await database;
    return await db.insert('vehiculos', {
      'codigo': codigo,
      'marca': marca,
      'modelo': modelo,
      'precio': precio,
    });
  }

  Future<List<Map<String, dynamic>>> obtenerVehiculos() async {
    final db = await database;
    return await db.query('vehiculos');
  }

  Future eliminarVehiculo(int id) async {
    final db = await database;
    return await db.delete('vehiculos', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> modificarVehiculo(
    int id,
    String codigo,
    String marca,
    String modelo,
    String precio,
  ) async {
    final db = await database;
    return await db.update(
      'vehiculos',
      {'codigo': codigo, 'marca': marca, 'modelo': modelo, 'precio': precio},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
