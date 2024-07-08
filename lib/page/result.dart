import 'package:flutter/material.dart';
import 'package:flutter_app_apr2/page/numbers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_apr2/shared/shared.dart' as sharedData;

// ignore: camel_case_types
class resultPage extends StatefulWidget {
  const resultPage({
    super.key,
  });

  @override
  State<resultPage> createState() => _resultPageState();
}

// ignore: camel_case_types
class _resultPageState extends State<resultPage> {
  int number1 = 0;
  int number2 = 0;
  String operation = '';
  String result = '';

  @override
  void initState() {
    super.initState();
    getDataFromStorage();
  }

  getDataFromStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    /*   number1 = int.parse(prefs.getString("num1")!);
    number2 = int.parse(prefs.getString("num2")!);
    operation = prefs.getString("op")!; */
    number1 = int.parse(sharedData.num1);
    number2 = int.parse(sharedData.num2);
    operation = sharedData.operation;
    switch (operation) {
      case '+':
        result = (number1 + number2).toString();
        break;
      case '-':
        result = (number1 - number2).toString();
        break;
      case '*':
        result = (number1 * number2).toString();
        break;
      case '/':
        result = (number1 / number2).toString();
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 208, 230),
        title: const Center(child: Text('Result')),
      ),
      body: Container(
        color: const Color.fromARGB(255, 124, 241, 206),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 48, 167, 204)),
                          height: 100,
                          child: Center(
                              child: Text(
                            "$number1$operation$number2=$result",
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ))),
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 5),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                  ),
                  child: InkWell(
                    child: const Icon(Icons.repeat_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NumberPage()),
                      );
                    },
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
