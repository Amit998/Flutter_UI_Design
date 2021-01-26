import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _dbName = 'myDatabase1.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';
  static final columnId = '_id';
  static final columnName = 'name';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper intance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    // print('inside db');
    if (_database != null) {
      // print(_database.batch());
      // print('not null');
      return _database;
    }
    // print('is null');

    _database = await _initiateDatabase();

    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL
      )
  ''');
    print('created');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await intance.database;
    print(db);

    // Map<String, dynamic> row = {
    // DatabaseHelper.columnName: 'BOB',
    // };
    // int id = await db.insert(DatabaseHelper._tableName, row);
    // print(await db.query(DatabaseHelper._tableName));
    // print(db);
    // return 1;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await intance.database;
    print('object');
    // return
    return await db.query(_tableName);
  }

  Future update(Map<String, dynamic> row) async {
    Database db = await intance.database;
    int id = row[columnId];
    print(id);

    return db.update(_tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await intance.database;
    print(id);
    return await db.delete(_tableName, where: '$columnId=?', whereArgs: [id]);
  }
}
