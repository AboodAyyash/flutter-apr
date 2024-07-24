import 'package:flutter/material.dart';
import 'package:flutter_apr/models/note.dart';
import 'package:flutter_apr/widgets/custom-icon-button.dart';

class EditorPage extends StatefulWidget {
  final String title;
  final String body;
  const EditorPage({super.key, required this.title, required this.body});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  Map note = {'title': "", 'body': ""};

  @override
  void initState() {
    super.initState();
    note['title'] = widget.title;
    note['body'] = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customIconButton(
            icon: Icons.arrow_back_ios,
            onPressed: () {
              Note modelNoteBack = Note(title: widget.title, body: widget.body);
              Navigator.pop(context, modelNoteBack);
            }),
        actions: [
          customIconButton(
              icon: Icons.save,
              onPressed: () {
                print(note);
                Note modelNote = Note(title: note['title'], body: note['body']);
                Navigator.pop(context, modelNote);
              }),
        ],
      ),
      body: ListView(
        children: [
          TextField(
            controller: TextEditingController(text: note['title']),
            style: const TextStyle(
              fontSize: 48,
            ),
            decoration: const InputDecoration(
              hintText: "Title",
              hintStyle: TextStyle(
                fontSize: 48,
              ),
            ),
            minLines: 1,
            maxLines: 1,
            onChanged: (value) {
              note['title'] = value;
            },
          ),
          TextField(
            controller: TextEditingController(text: note['body']),
            style: const TextStyle(
              fontSize: 23,
            ),
            decoration: const InputDecoration(
              hintText: "Type something...",
              hintStyle: TextStyle(
                fontSize: 23,
              ),
            ),
            minLines: 20,
            maxLines: 20,
            onChanged: (value) {
              note['body'] = value;
            },
          ),
        ],
      ),
    );
  }
}
