import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_apr2/models/note.dart';
import 'package:flutter_app_apr2/page/editor.dart';
import 'package:flutter_app_apr2/widgets/custom-icon-button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(
            fontSize: 45,
          ),
        ),
        actions: [
          customIconButton(icon: Icons.search),
        ],
      ),
      body: /*  notes.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/photo.jpg',
                      height: 150,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Create your first note !"),
              ],
            )
          : */
          ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          for (int i = 0; i < notes.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: randomColors(),
                  ),
                  child: Text(
                    notes[i].title,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const EditorPage(),
            ),
          );
          print("result = $result");
          notes.add(result);
          setState(() {});
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
        shape: CircleBorder(),
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
