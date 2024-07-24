import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_apr/DB/note.dart';
import 'package:flutter_apr/controllers/note.dart';
import 'package:flutter_apr/models/note.dart';
import 'package:flutter_apr/page/editor.dart';
import 'package:flutter_apr/shared/note.dart';
import 'package:flutter_apr/widgets/custom-icon-button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNotes();
  }

  getAllNotes() async {
    await DataBaseNotes().initDatabase();
    DataBaseNotes().getAllNotes().then((value) {
      print(value);
      setState(() {
        notes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(
            fontSize: 45,
          ),
        ),
        actions: [
          customIconButton(icon: Icons.search),
        ],
      ),
      body: notes.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/note.png',
                      height: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Create your first note !"),
              ],
            )
          : ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                for (int i = 0; i < notes.length; i++)
                  if (notes[i].title.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            var r = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditorPage(
                                      title: notes[i].title,
                                      body: notes[i].body)),
                            );

                            await updateNoteData(i, r);
                            setState(() {});
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: randomColors(),
                            ),
                            child: Container(
                              child: Text(
                                notes[i].title,
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          mouseCursor: SystemMouseCursors.click,
                          onTap: () async {
                            await deleteNote(i);
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(
                              Icons.delete,
                              size: 35,
                            ),
                          ),
                        )
                      ],
                    )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const EditorPage(
                title: '',
                body: '',
              ),
            ),
          );
          print("result = $result");
          addNote(result);
          setState(() {});
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
        shape: const CircleBorder(),
      ),
    );
  }

  Color randomColors() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}
