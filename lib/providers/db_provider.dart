import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/models/scan_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database?> initDB() async {
    //Path de donde alamacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    //Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
''');
      },
    );
  }

  Future<int?> nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    final db = await database;
    final res = await db?.rawInsert(''' 
          INSERT INTO Scans(id, tipo, valor)
          VALUES ($id,$tipo,$valor)
    ''');

    return res;
  }

  Future<int?> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db?.insert('Scans', nuevoScan.toMap());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db?.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res!.isNotEmpty ? ScanModel.fromMap(res!.first) : null;
  }

  Future<List<ScanModel>?> allScans() async {
    final db = await database;
    final res = await db?.query('Scans');

    return res!.isNotEmpty ? res.map((e) => ScanModel.fromMap(e)).toList() : [];
  }

  Future<List<ScanModel>?> getScanByType(String tipo) async {
    final db = await database;
    final res = await db?.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);

    return res!.isNotEmpty ? res.map((e) => ScanModel.fromMap(e)).toList() : [];
  }

  Future<int?> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db!.update('Scans', nuevoScan.toMap(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int?> deleteScan(int id) async {
    final db = await database;
    final res = db!.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int?> deleteAllScans() async {
    final db = await database;
    final res = db!.rawDelete(''' 
        DELETE FROM Scans    
    ''');
    return res;
  }
}
