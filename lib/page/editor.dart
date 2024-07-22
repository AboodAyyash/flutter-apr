import 'package:flutter/material.dart';
import 'package:flutter_app_apr2/models/note.dart';
import 'package:flutter_app_apr2/widgets/custom-icon-button.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  Map note = {'title': "", 'body': ""};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customIconButton(
          icon: Icons.arrow_back_ios,
        ),
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
            style: const TextStyle(
              fontSize: 48,
            ),
            decoration: const InputDecoration(
              hintText: "Title",
              hintStyle: TextStyle(
                fontSize: 48,
              ),
            ),
            minLines: 5,
            maxLines: 5,
            onChanged: (value) {
              note['title'] = value;
            },
          ),
          TextField(
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
