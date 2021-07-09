import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _dbName = 'myDb1.db';
  static final _dbVersion = 1;
  static final _tableName = 'trainer1';

  static final colId = 'db_id';
  static final colTrainerId = 't_id';
  static final colMp3Path = 'path';
  static final colMp3Length = 'length';
  static final colMp3Type = 'type';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async =>
      _database ??= await _initiateDatabase();

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion,
        onCreate: (Database db, int version) async {
          await db.execute(''' 
      CREATE TABLE $_tableName( 
      $colId INTEGER PRIMARY KEY,
      $colTrainerId INTEGER,
      $colMp3Path TEXT NOT NULL, 
      $colMp3Length INTEGER,
      $colMp3Type INTEGER ) 
      ''');
        });
  }
// {
// "_id":12,
// "name":"Saheb"
// }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[colId];
    return await db
        .update(_tableName, row, where: '$colId = ?', whereArgs: [id]);
  }

  Future delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$colId = ?', whereArgs: [id]);
  }
}
