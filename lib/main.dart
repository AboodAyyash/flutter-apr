import 'dart:html';

import 'package:flutter/cupertino.dart';
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
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.amber),
        ),
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

  List photos = [
    "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
    "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
    "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
    'assets/photo.jpg',
    "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
    "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
  ];

  List<Map> products = [
    {
      'name': "Water",
      'price': 10,
      'img':
          "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
    },
    {
      'name': "Chips",
      'price': 5,
      'img':
          "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
    },
    {
      'name': "Cocacola",
      'price': 3,
      'img': "assets/photo.jpg",
    },
  ];

  /* 
  Image       Image
  price       price 
  name        name


  Image
  price
  name
   */

  String num1 = "";
  String num2 = "";
  String total = "";
  String op = '';

  String name = "";
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  bool showWelcome = false;

  final formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;
  String radioValue = '0';
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " $screenWidth",
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
      body: ListView(
        // reverse: true,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: textEditingController,
              onChanged: (value) {
                print("C V $value");
                print("C C ${textEditingController.text}");
              },
              onSubmitted: (value) {
                print("S V $value");
                print("S C ${textEditingController.text}");
              },
              onTap: () {
                print("T C ${textEditingController.text}");
              },
              onEditingComplete: () {
                print("E C ${textEditingController.text}");
              },
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                hintText: "Hint",
                labelText: "First Name",
                labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                //  hintStyle: TextStyle(fontSize: 20, color: Colors.red),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: textEditingController2,
              onChanged: (value) {
                print("C V $value");
                print("C C ${textEditingController2.text}");
              },
              onSubmitted: (value) {
                print("S V $value");
                print("S C ${textEditingController2.text}");
              },
              onTap: () {
                print("T C ${textEditingController2.text}");
              },
              onEditingComplete: () {
                print("E C ${textEditingController2.text}");
              },
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                hintText: "Hint",
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                //  hintStyle: TextStyle(fontSize: 20, color: Colors.red),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              if (textEditingController.text.isNotEmpty &&
                  textEditingController2.text.isNotEmpty) {
                setState(() {
                  showWelcome = true;
                });
              }
            },
            child: Text("Login"),
          ),
          SizedBox(
            height: 20,
          ),
          showWelcome
              ? Text(
                  "Welcome ${textEditingController.text} ${textEditingController2.text}",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Add Name";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.green),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: "Hint",
                      labelText: "Name",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                      //  hintStyle: TextStyle(fontSize: 20, color: Colors.red),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Please Add Full Password";
                      }
                      if (value.contains("@")) {
                        return null;
                      } else {
                        return "Please Add @ in your Password";
                      }
                    },
                    style: TextStyle(color: Colors.green),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: "Hint",
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                      //  hintStyle: TextStyle(fontSize: 20, color: Colors.red),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Please Add Full Email";
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return "Please Add Full Email";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.green),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: "Hint",
                      labelText: "Email",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                      //  hintStyle: TextStyle(fontSize: 20, color: Colors.red),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CheckboxListTile(
                  value: checkBoxValue,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      checkBoxValue = value!;
                    });
                  },
                  title: Text("I Agree Terms & Conditions"),
                ),
                RadioListTile(
                  groupValue: radioValue,
                  value: '1',
                  title: Text("1"),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
                RadioListTile(
                  groupValue: radioValue,
                  value: '2',
                  title: Text("2"),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate() && checkBoxValue) {
                      print("Done");
                    }
                  },
                  child: Text("Submet"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            total == '' ? "$num1 $op $num2" : "$num1 $op $num2 = $total",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 1,
            crossAxisSpacing: 2,
            children: [
              for (int i = 0; i < 10; i++) numbersButton(i),
              opButton('*'),
              opButton('/'),
              opButton('-'),
              opButton('+'),
              twoButtons('C', Colors.amber),
              twoButtons('=', Colors.green),
            ],
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }

  Widget numbersButton(int num) {
    return InkWell(
      onTap: () {
        print(num);
        if (total != '') {
          setState(() {
            total = "";
            num1 = '';
            num2 = '';
            op = '';
          });
        }
        if (op == "")
          setState(() {
            num1 += num.toString();
          });
        else
          setState(() {
            num2 += num.toString();
          });
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: Text(
          "$num",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget opButton(String op) {
    return InkWell(
      onTap: () {
        setState(() {
          this.op = op;
        });
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text(
          "$op",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget twoButtons(String button, Color color) {
    return InkWell(
      onTap: () {
        print(button);
        if (button == "=") {
          if (op == "+") {
            setState(() {
              total = (int.parse(num1) + int.parse(num2)).toString();
            });
          }
          if (op == "-") {
            setState(() {
              total = (int.parse(num1) - int.parse(num2)).toString();
            });
          }
          if (op == "*") {
            setState(() {
              total = (int.parse(num1) * int.parse(num2)).toString();
            });
          }
          if (op == "/") {
            setState(() {
              total = (int.parse(num1) / int.parse(num2)).toString();
            });
          }
        } else {
          setState(() {
            total = "";
            num1 = '';
            num2 = '';
            op = '';
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          "$button",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// *  *  *
// *  *  *
// *  *  *

// /  *   -  +   =
// 1  2  3   4   5
// 6  7  8   9   0

// 1 * 3 = 3
// 6 - 4 = 2
