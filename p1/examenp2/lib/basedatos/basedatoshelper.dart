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
    String path = join(await getDatabasesPath(), 'Registro.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Registro(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            nip TEXT NOT NULL,
            saldo REAL NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertarRegistro(String nombre, String nip, double saldo) async {
    final db = await database;
    return await db.insert('Registro', {
      'nombre': nombre,
      'nip': nip,
      'saldo': saldo,
    });
  }

  Future<List<Map<String, dynamic>>> obtenerRegistros(v) async {
    final db = await database;
    return await db.query('Registro');
  }

  Future<int> eliminarRegistro(int id) async {
    final db = await database;
    return await db.delete('Registro', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> modificarRegistro(
    int id,
    String nombre,
    String nip,
    double saldo,
  ) async {
    final db = await database;
    return await db.update(
      'Registro',
      {'nombre': nombre, 'nip': nip, 'saldo': saldo},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
