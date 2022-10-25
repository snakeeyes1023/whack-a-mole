import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wack_a_mole/src/data/entities/score_entity.dart';

class ScoreService {
  Future<Database>? database;
  static const String databasePath = 'wack-a-mole.db';
  static const String tableScoreName = 'Score';
  ScoreService() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<Database> getDatabaseInstance() async {
    database ??= openDatabase(
      join(await getDatabasesPath(), databasePath),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS $tableScoreName(id INTEGER PRIMARY KEY,name TEXT, score INTEGER, creation_date TEXT)",
        );
      },
      version: 2,
    );

    return database!;
  }

  Future<void> insertScore(ScoreEntity score) async {
    // Get a reference to the database.
    final Database db = await getDatabaseInstance();

    await db.insert(
      tableScoreName,
      score.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print('Score inserted');
    final List<ScoreEntity> scoresList = await scores();

    scoresList.forEach((element) {
      print(element.toString());
    });
  }

  Future<List<ScoreEntity>> scores() async {
    final Database db = await getDatabaseInstance();

    final List<Map<String, dynamic>> maps = await db.query(tableScoreName);

    return List.generate(maps.length, (i) {
      return ScoreEntity.FromMap(maps[i]);
    });
  }

  Future<void> deleteScore(int id) async {
    final db = await getDatabaseInstance();

    await db.delete(
      tableScoreName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> updateScore(ScoreEntity score) async {
    final db = await getDatabaseInstance();

    await db.update(
      tableScoreName,
      score.toMap(),
      where: "id = ?",
      whereArgs: [score.id],
    );
  }
}
