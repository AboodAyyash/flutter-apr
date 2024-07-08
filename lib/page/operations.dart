import 'package:flutter/material.dart';
import 'package:flutter_app_apr2/page/equals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_apr2/shared/shared.dart' as sharedData;

// ignore: camel_case_types
class opPage extends StatefulWidget {
  const opPage({
    super.key,
  });

  @override
  State<opPage> createState() => _opPageState();
}

// ignore: camel_case_types
class _opPageState extends State<opPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textFieldController1 = TextEditingController();
  String op = '';
  String display = '';

  // ignore: non_constant_identifier_names
  void Display() {
    setState(() {
      _textFieldController1.text = op;
    });
  }

  void onOpPressed(String op) {
    this.op = op;
    Display();
  }

  void onClearPressed() {
    op = '';
    display = '';
    Display();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 87, 208, 230),
          title: const Center(child: Text('Operation')),
        ),
        body: Container(
          color: const Color.fromARGB(255, 179, 243, 159),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text_Form_Field(_textFieldController1),
                  )
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
                    opBotton('+'),
                    opBotton('-'),
                    opBotton('*'),
                    opBotton('/'),
                    clear('C'),
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
                      prefs.setString("op", op);
                      sharedData.operation = op;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => equalPage()),
                        //num1: this.num1, num2: this.num2
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

  InkWell opBotton(String op) {
    return InkWell(
      onTap: () => onOpPressed(op),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 91, 220, 230),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: Text(
            op,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
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
}
