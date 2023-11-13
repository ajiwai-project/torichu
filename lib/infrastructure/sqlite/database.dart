import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void setupSqlite() {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
}

class SqliteDao {
  static const dbName = 'spender.db';
  static const version = 1;
  SqliteDao._();
  static final SqliteDao _instance = SqliteDao._();
  factory SqliteDao.getInstance() => _instance;
  static Database? __database;

  Future<Database> get _database async => __database ??= await _initDb();

  Future<Database> _initDb() async {
    return openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: _onCreate,
      version: version,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS costs(id TEXT PRIMARY KEY, title TEXT, amount INTEGER, size INTEGER, registeredAt TEXT)');
  }

  Future<int> create({
    required String tableName,
    required Map<String, Object?> json,
  }) async {
    final db = await _database;
    return db.insert(tableName, json);
  }

  Future<List<Map<String, Object?>>> readAll({
    required String tableName,
  }) async {
    final db = await _database;
    return db.query(tableName);
  }

  Future<int> delete({
    required String tableName,
    required String id,
  }) async {
    final db = await _database;
    return db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
