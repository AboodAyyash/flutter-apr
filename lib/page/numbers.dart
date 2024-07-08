import 'package:flutter/material.dart';
import 'package:flutter_app_apr2/page/operations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_apr2/shared/shared.dart' as sharedData;

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();

  String num1 = '';
  String num2 = '';
  String total = '';
  bool flag = true;
  String display = '';

  // ignore: non_constant_identifier_names
  void Display() {
    setState(() {
      _textFieldController1.text = num1;
      _textFieldController2.text = num2;
    });
  }

  void onNumberPressed(String num) {
    if (flag) {
      num1 += num;
    } else {
      num2 += num;
    }

    Display();
  }

  void onClearPressed() {
    num1 = '';
    num2 = '';
    flag = true;
    Display();
  }

  // ignore: non_constant_identifier_names
  void on_Swape_Pressed() {
    flag = !flag;
  }

  getLocaleData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    /*  prefs.setString("name", "Ali");
    prefs.setInt("age", 15);
    prefs.setDouble("age", 15.0);
    prefs.setBool("isMarried", true);
 */
    print(prefs.getString("name"));
    print(prefs.getInt("age"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 87, 208, 230),
          title: const Center(child: Text('Numbers')),
          actions: [
            IconButton(
              onPressed: () {
                getLocaleData();
              },
              icon: Icon(Icons.abc),
            )
          ],
        ),
        body: Container(
          color: const Color.fromARGB(255, 165, 243, 213),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Form(
                key: _formKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text_Form_Field(_textFieldController1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text_Form_Field(_textFieldController2),
                  ),
                ]),
              ),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                  ),
                  children: [
                    for (int i = 1; i <= 9; i++) textButton('$i'),
                    clear('C'),
                    swap(),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 5),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue,
                ),
                child: InkWell(
                  child: const Icon(Icons.navigate_next),
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("num1", num1);
                      prefs.setString("num2", num2);
                      sharedData.num1 = num1;
                      sharedData.num2 = num2;
                   
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => opPage()),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  TextFormField Text_Form_Field(TextEditingController textController) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter number';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          print(value);
          _formKey.currentState!.validate();
        });
      },
      controller: textController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 14, 11, 11), width: 3),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 14, 11, 11), width: 3),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );
  }

  Widget textButton(String value) {
    return InkWell(
      onTap: () => onNumberPressed(value),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 209, 90),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  InkWell clear(String C) {
    return InkWell(
      onTap: () => onClearPressed(),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 201, 83, 236),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: Text(
            C,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  swap() {
    return InkWell(
      onTap: () => on_Swape_Pressed(),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 204, 80, 138),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: const Center(
          child: Icon(
            Icons.swap_horiz,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
