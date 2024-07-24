import 'dart:async';

import 'package:flutter_apr/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseNotes {
  String dataBaseName = 'notes.db';
  int dataBaseVersion = 1;
  String tableName = "notes";

  Future initDatabase() async {
    String dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, dataBaseName);
    return openDatabase(path, version: dataBaseVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableName (
                        title TEXT,
                        body TEXT
                                      )''');
  }

  Future<List<Note>> getAllNotes() async {
    Database db = await initDatabase();
    List<Map<String, dynamic>> dbNotes = await db.query(tableName);

    return List.generate(dbNotes.length, (i) {
      return Note.fromMap(dbNotes[i]);
    });
  }

  Future insertNote(Note note) async {
    Database db = await initDatabase();
    db.insert(tableName, note.toMap());
  }

  Future updataNote(Note note) async {
    Database db = await initDatabase();
    db.update(
      tableName,
      note.toMap(),
      where: 'title = ?',
      whereArgs: [note.title],
    );
  }

  Future deleteNote(Note note) async {
    Database db = await initDatabase();
    db.delete(
      tableName,
      where: 'title = ?',
      whereArgs: [note.title],
    );
  }
}
