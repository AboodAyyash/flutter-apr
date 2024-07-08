import 'package:flutter/material.dart';
import 'package:flutter_app_apr2/page/result.dart';

// ignore: camel_case_types
class equalPage extends StatelessWidget {


  const equalPage(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 145, 121),
        title: const Center(child: Text('Equal')),
      ),
      body: Container(
        color: const Color.fromARGB(255, 124, 208, 211),
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 5),
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 45, 92, 63),
            ),
            child: InkWell(
              child: const Icon(
                Icons.skip_next,
                size: 100,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          resultPage()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
