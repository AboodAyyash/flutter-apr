import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* 

class ValuePage extends StatelessWidget {
  String total;
  String num2;
  String op;
  String num1;
  ValuePage(
      {required this.total,
      required this.op,
      required this.num2,
      required this.num1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(total),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.back_hand),
        ),
        actions: [
          IconButton(
            onPressed: () {
              num1 = "0";
            },
            icon: Icon(Icons.calculate),
          ),
        ],
      ),
      body: ListView(
        children: [
          Text("num1 = $num1"),
          Text("op = $op"),
          Text("num2 = $num2"),
          Text("total = $total"),
        ],
      ),
    );
  }
}
 */

class ValuePage extends StatefulWidget {
  final String total;
  final String num2;
  final String op;
  final String num1;
  const ValuePage(
      {required this.total,
      required this.op,
      required this.num2,
      required this.num1});

  @override
  State<ValuePage> createState() => _ValuePageState();
}

class _ValuePageState extends State<ValuePage> {
  String total = '';
  String num2 = '';
  String op = '';
  String num1 = '';

  @override
  void initState() {
    total = widget.total;
    num2 = widget.num2;
    op = widget.op;
    num1 = widget.num1;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(total),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.back_hand),
        ),
        actions: [
          IconButton(
            onPressed: () {
              num1 = "0";
              setState(() {});
            },
            icon: Icon(Icons.calculate),
          ),
        ],
      ),
      body: ListView(
        children: [
          Text("num1 = $num1"),
          Text("op = $op"),
          Text("num2 = $num2"),
          Text("total = $total"),
        ],
      ),
    );
  }
}


// num1 = 
// op = 
// num2 = 
// total =