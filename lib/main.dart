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
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                bool isNetwork =
                    products[index]['img'].toString().contains("http");
                print(isNetwork);
                return InkWell(
                  onTap: () {
                    print(products[index]['img']);
                  },
                  child: Column(
                    children: [
                      if (isNetwork)
                        Image.network(
                          products[index]['img'],
                          width: 100,
                        )
                      else
                        Image.asset(
                          products[index]['img'],
                          width: 100,
                        ),
                      Text("${products[index]['price']} \$"),
                      Text(products[index]['name'])
                    ],
                  ),
                );
              }),
          ListView.builder(
            shrinkWrap: true,
            itemCount: photos.length,
            itemBuilder: (context, index) {
              bool isNetwork = photos[index].toString().contains("http");
              print(isNetwork);
              if (isNetwork)
                return Image.network(photos[index]);
              else
                return Image.asset(photos[index]);
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: photos.length,
            itemBuilder: (context, index) {
              bool isNetwork = photos[index].toString().contains("http");
              print(isNetwork);
              if (isNetwork)
                return Image.network(photos[index]);
              else
                return Image.asset(photos[index]);
            },
          ),
          for (int i = 0; i < 5; i++)
            i < 3
                ? Image.asset(
                    'assets/photo.jpg',
                    fit: BoxFit.cover,
                  )
                : i == 3
                    ? Image.asset(
                        'assets/photo.jpg',
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/photo.jpg',
                        fit: BoxFit.cover,
                      ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Image.network(
                  "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                ),
                Image.network(
                  "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Image.network(
                  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                ),
                Image.network(
                  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                ),
                Image.network(
                  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                ),
                Image.network(
                  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                ),
                Image.network(
                  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                ),
                Image.network(
                  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.count(
            //   padding: EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            crossAxisCount: screenWidth <= 600 ? 2 : 3,

            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(10, (index) {
              print(index);
              return Image.asset(
                'assets/photo.jpg',
                fit: BoxFit.cover,
              );
            }),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(10, (index) {
              print(index);
              return Image.asset(
                'assets/photo.jpg',
                fit: BoxFit.cover,
                width: 70,
              );
            }),
          ),
          Image.network(
            "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
          ),
          Image.asset(
            'assets/photo.jpg',
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
          ),
          Image.asset(
            'assets/photo.jpg',
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
          ),
        ],
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
