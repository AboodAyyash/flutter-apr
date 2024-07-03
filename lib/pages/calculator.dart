import 'package:flutter/material.dart';
import 'package:flutter_apr/pages/value.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String num1 = "";
  String op = "";
  String num2 = "";
  String total = "";

  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _opController = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  bool _num1Error = false;
  bool _opError = false;
  bool _num2Error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextField(
                controller: _num1Controller,
                labelText: 'text field 1',
                errorText: _num1Error ? 'field required' : null,
                onChanged: (value) {
                  setState(() {
                    num1 = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              buildTextField(
                controller: _opController,
                labelText: 'text field 2',
                errorText: _opError ? ' field  required' : null,
                onChanged: (value) {
                  setState(() {
                    op = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              buildTextField(
                controller: _num2Controller,
                labelText: 'text field 3',
                errorText: _num2Error ? ' field required' : null,
                onChanged: (value) {
                  setState(() {
                    num2 = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                total == '' ? "$num1 $op $num2" : "$num1 $op $num2 = $total",
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20),
              buildGridView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? errorText,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        errorText: errorText,
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (int i = 0; i < 10; i++) buildNumberButton(i),
        buildOpButton('*'),
        buildOpButton('/'),
        buildOpButton('-'),
        buildOpButton('+'),
        buildOpButton('C'),
        buildOpButton('='),
      ],
    );
  }

  Widget buildNumberButton(int num) {
    return InkWell(
      onTap: () {
        if (total.isNotEmpty) {
          clearAll();
        }
        if (op.isEmpty) {
          setState(() {
            num1 += num.toString();
            _num1Controller.text = num1;
          });
        } else {
          setState(() {
            num2 += num.toString();
            _num2Controller.text = num2;
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 226, 145, 139),
        child: Text(
          "$num",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildOpButton(String op) {
    return InkWell(
      onTap: () {
        if (total.isNotEmpty) {
          clearAll();
        }
        setState(() {
          if (op == 'C') {
            clearAll();
          } else if (op == '=') {
            validateAndCalculate();
          } else {
            if (num1 == '') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Please add Num 1 first!'),
                ),
              );
            } else {
              this.op = op;
              _opController.text = op;
              _opError = false;
            }
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 134, 136, 138),
        child: Text(
          op,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void clearAll() {
    setState(() {
      total = "";
      num1 = '';
      num2 = '';
      op = '';
      _num1Controller.clear();
      _opController.clear();
      _num2Controller.clear();
      _num1Error = false;
      _opError = false;
      _num2Error = false;
    });
  }

  void validateAndCalculate() {
    setState(() {
      _num1Error = _num1Controller.text.isEmpty;
      _opError = _opController.text.isEmpty;
      _num2Error = _num2Controller.text.isEmpty;

      if (!_num1Error && !_opError && !_num2Error) {
        switch (op) {
          case '+':
            total = (int.parse(num1) + int.parse(num2)).toString();
            break;
          case '-':
            total = (int.parse(num1) - int.parse(num2)).toString();
            break;
          case '*':
            total = (int.parse(num1) * int.parse(num2)).toString();
            break;
          case '/':
            total = (int.parse(num1) / int.parse(num2)).toString();
            break;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ValuePage(
              num1: num1,
              num2: num2,
              op: op,
              total: total,
            ),
          ),
        );
      }
    });
  }
}
