import 'package:flutter_apr/DB/note.dart';
import 'package:flutter_apr/models/note.dart';
import 'package:flutter_apr/shared/note.dart';

Future updateNoteData(index, newNote) async {
  await DataBaseNotes().initDatabase();
  await DataBaseNotes().updataNote(newNote);
  notes[index] = newNote;
}

Future deleteNote(index) async {
  await DataBaseNotes().initDatabase();
  await DataBaseNotes().deleteNote(notes[index]);
  notes.removeAt(index);
}

Future addNote(Note newNote) async {
  await DataBaseNotes().initDatabase();
  DataBaseNotes().insertNote(newNote);
  notes.add(newNote);
}
