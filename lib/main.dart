import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;
  double screenWidth = double.infinity;
  double screenHight = 0;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DAta",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.lime.shade900.withOpacity(0.25),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              number += 2;
              print(number);
              setState(() {});
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              number += 3;
              print(number);
              setState(() {});
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Container(
            color: Colors.amber,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      number += 1;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        // borderRadius: BorderRadius.circular(5),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                        ),
                        border: Border.all(
                          color: Colors.red.shade300,
                          width: 10,
                        ),
                      ),
                      // margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.only(left: 10, top: 50),
                      height: 100,
                      width: 100,
                      child: Text("$number"),
                      // alignment: Alignment.bottomLeft,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: () {
                      number += 1;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        // borderRadius: BorderRadius.circular(5),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                        ),
                        border: Border.all(
                          color: Colors.red.shade300,
                          width: 10,
                        ),
                      ),
                      // margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.only(left: 10, top: 50),
                      height: 100,
                      width: 100,
                      child: Text("$screenWidth + $screenHight"),
                      // alignment: Alignment.bottomLeft,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// /  *   -  +   =
// 1  2  3   4   5
// 6  7  8   9   0


// 1 * 3 = 3
// 6 - 4 = 2
