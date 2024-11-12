import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'amount.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE amount(
            currentAmount REAL,
            goalAmount REAL,
            goalName TEXT PRIMARY KEY,
            goalImage TEXT
          )
          ''',
        );
      },
    );
  }

  // Insertar datos en la tabla
  Future<void> insertAmount(AmountModel amount) async {
    final db = await database;
    await db.insert(
      'amount',
      amount.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Obtener los datos de la tabla
  Future<AmountModel?> getAmount(String goalName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'amount',
      where: 'goalName = ?',
      whereArgs: [goalName],
    );
    if (maps.isNotEmpty) {
      return AmountModel.fromJson(maps.first);
    }
    return null;
  }

  // Actualizar el registro
  Future<void> updateAmount(AmountModel amount) async {
    final db = await database;
    await db.update(
      'amount',
      amount.toJson(),
      where: 'goalName = ?',
      whereArgs: [amount.goalName],
    );
  }

  // Eliminar el registro
  Future<void> deleteAmount(String goalName) async {
    final db = await database;
    await db.delete(
      'amount',
      where: 'goalName = ?',
      whereArgs: [goalName],
    );
  }
}
