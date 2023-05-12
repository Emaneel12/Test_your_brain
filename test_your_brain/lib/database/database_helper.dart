//database operations like opening the database, inserting and retrieving data, and closing the database.

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import '../utils/user_score.dart';

class DatabaseHelper {
  // name of the database
  static const _databaseName = "user_scores.db";
  //version of the database
  static const _databaseVersion = 1;
  //name of the table
  static const table = 'user_scores';
  //name of the columns
  static const columnId = 'id';
  static const columnUsername = 'username';
  static const columnScore = 'score';
  //name of the primary key
  static Database? _database;
  //creating a singleton instance of the DatabaseHelper class
  DatabaseHelper._privateConstructor();
  //opening the database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  //opening the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  //initializing the database
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnUsername TEXT NOT NULL,
            $columnScore INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insertUserScore(UserScore userScore) async {
    Database db = await instance.database;
    return await db.insert(table, userScore.toMap());
  }

  Future<List<UserScore>> getUserScores(String username) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(table,
        columns: [columnId, columnUsername, columnScore],
        where: '$columnUsername = ?',
        whereArgs: [username]);
    if (maps.isEmpty) {
      return [];
    }
    return List.generate(maps.length, (i) {
      return UserScore(
        id: maps[i][columnId],
        username: maps[i][columnUsername],
        score: maps[i][columnScore],
      );
    });
  }
}
