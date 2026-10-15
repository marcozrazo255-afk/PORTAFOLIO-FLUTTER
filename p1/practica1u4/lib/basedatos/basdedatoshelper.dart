import 'dart:ffi';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Basdedatoshelper {
  static final Basdedatoshelper _instance = Basdedatoshelper._internal();
  factory Basdedatoshelper() => _instance;

  Basdedatoshelper._internal();
  Database? _database!;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _iniitDB(),
    return _database;

  }
  Future <Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'usuarios.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async(
        await.db.execute(
          '''
          CREATE TABLE usuario(
            id INTEGER PRIMARY KEY AUTOINCREMENTE,
            usuario TEXT NOT NULL,
            password TEXT NOT NULL,
          )
          ''');
        )
      );
    
  }
    Future<Int> insertar(String usuario, String password) async{
      final db = await database;
      return await db.insert('usuario',{
      'usuario' : usuario,
      'password' : password,
        
    });
  }
}