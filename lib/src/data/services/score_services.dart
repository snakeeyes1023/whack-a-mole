import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wack_a_mole/src/data/entities/score_entity.dart';

class ScoreService {
  late final Future<Database>? database;
  static const String databasePath = 'scores.db';

  ScoreService() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<Database> getDatabaseInstance() async {
    database ??=
        openDatabase(join(await getDatabasesPath(), databasePath), version: 1);

    return database!;
  }

  Future<void> insertScore(ScoreEntity score) async {
    // Get a reference to the database.
    final Database db = await getDatabaseInstance();

    await db.insert(
      'scores',
      score.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ScoreEntity>> scores() async {
    final Database db = await getDatabaseInstance();

    final List<Map<String, dynamic>> maps = await db.query('scores');

    return List.generate(maps.length, (i) {
      return ScoreEntity.FromMap(maps[i]);
    });
  }

  Future<void> deleteScore(int id) async {
    final db = await getDatabaseInstance();

    await db.delete(
      'scores',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> updateScore(ScoreEntity score) async {
    final db = await getDatabaseInstance();

    await db.update(
      'scores',
      score.toMap(),
      where: "id = ?",
      whereArgs: [score.id],
    );
  }
}
