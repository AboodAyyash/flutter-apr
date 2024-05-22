void main() {
  print(12);

  var name = "Ahmad";

  int age = 45;
  print(name + " age = 12");

  print("$name age = 12");

  print("$name \$12 \"");

  int num1 = 10;
  int num2 = 5;

  int sum = num1 + num2;
  print(sum);

  print(num1 + num2);

  String fName = "Ahmad";
  String lName = "Omar";

  print(fName + lName);

  print("$name age = $age");

  print("$name age = " + age.toString());

  int x = 10;
  String y = "Who";
  double z = 10.2;
  num n = 10.5;
  bool f = false;

  var v = true;

  var xx = 10;
  var ss = "s";
  print("$ss $xx");

  const int xxx = 10;
  final int xxxx;
  xxxx = 10;
  print(xxx);
  print(xxxx);
  print(xxx + xxxx);

  print("Hello my age = ${xxx + xxxx}");

  List list = [];
  Map map = {};

  double dd = 10.02448;
  print(dd.toString());

  print(dd.toStringAsFixed(2));

  String sss = "10";

  double ee = double.parse(sss);
  print(ee);
  print(ee + 10);

  int ii = int.parse(sss);

  print(ii);

  int iii = ee.toInt();
  print(iii);

  double iiii = iii.toDouble();
  print(iiii);

  String vv = '''  Hello  Hello
  
  ' "
  Hello Hello
  
  
     ''';

  print(vv);

  String vvv = "HEllo\tHello \n\n\nHEll o\tHello";
  print(vvv);

  var xf = 10;
  print(xf.runtimeType);

  //one Line Comment

  /* 
  fhsdlkfhdslg
  ljsdhglkds
  ,jksdhbglkjsd
  nhsljdkgfhbk
   */

  int io = 10;
  int io2 = ++io;
  print(io2);

  io2 += io;
  print(io2);

  int io3 = 5;
  print(io == io2);
  print(io <= io2);
  print(io >= io2);

  print((io == io2) && (io == io3));
  print((io <= io2) && (io <= io3));
  print((io >= io2) && (io >= io3));

  print((io == io2) || (io == io3));
  print((io <= io2) || (io <= io3));
  print((io >= io2) || (io >= io3));

  print(io3 is String);
  print(io3 is! String);

  String str = "  Hi  ";

  print(str.isEmpty);
  print(str.isNotEmpty);

  print(str);
  print(str.toLowerCase());
  print(str.toUpperCase());

  print(str.trim());
  print(str.trimRight());

  print(str.replaceAll("i", "ello").trim());

  String string = 'dartlang';
  print(string.substring(2, 4));
  print(string.split("a"));

  int age2 = 20;
  if (age2 < 18) {
    print("You are an adult");
  } else {
    print("You are a child");
  }

  bool isMarried = (age2 > 18);
  if (isMarried) {
    print(true);
  } else {
    print(false);
  }

  int noOfMonth = 20;

  if (noOfMonth == 1) {
    print("The month is jan");
  } else if (noOfMonth == 2) {
    print("The month is feb");
  } else if (noOfMonth == 3) {
    print("The month is march");
  } else if (noOfMonth == 4) {
    print("The month is april");
  } else if (noOfMonth == 5) {
    print("The month is may");
  } else if (noOfMonth == 6) {
    print("The month is june");
  } else if (noOfMonth == 7) {
    print("The month is july");
  } else if (noOfMonth == 8) {
    print("The month is aug");
  } else if (noOfMonth == 9) {
    print("The month is sep");
  } else if (noOfMonth == 10) {
    print("The month is oct");
  } else if (noOfMonth == 11) {
    print("The month is nov");
  } else if (noOfMonth == 12) {
    print("The month is dec");
  } else {
    print("Invalid option given.");
  }

  int num11 = 1200;
  int num22 = 1000;
  int num33 = 150;

  if (num11 > num22 && num11 > num33) {
    print("Num 1 is greater: i.e $num11");
  }
  if (num22 > num11 && num22 > num33) {
    print("Num2 is greater: i.e $num22");
  }
  if (num33 > num11 && num33 > num22) {
    print("Num3 is greater: i.e $num33");
  }

  if (num11 > num22 || num11 > num33) {
    print("Num 1 is greater: i.e $num11");
  }
  if (num22 > num11 || num22 > num33) {
    print("Num2 is greater: i.e $num22");
  }
  if (num33 > num11 || num33 > num22) {
    print("Num3 is greater: i.e $num33");
  }
  print(num33 < num11 ? "yes" : "no");

  print(num33 > num11
      ? "yes"
      : num22 < num11
          ? 'yes2'
          : "no");

  int dayOfWeek = 5;
  switch (dayOfWeek.toString()) {
    case '1':
      print("Day is Sunday.");
      break;
    case '2':
      print("Day is Monday.");
      break;
    case '3':
      print("Day is Tuesday.");
      break;
    case '4':
      print("Day is Wednesday.");
      break;
    case '5':
      print("Day is Thursday.");
      break;
    case '6':
      print("Day is Friday.");
      break;
    case '7':
      print("Day is Saturday.");
      break;
    default:
      print("Invalid Weekday.");
      break;
  }

  int num111 = 10;
  int num222 = 15;
  int max = (num111 > num222) ? num111 : num222;
  print("The greatest number is $max");

  for (int i = 0; i <= 5; i++) {
    print(i);
  }
  for (int i = 10; i >= 1; i--) {
    print(i);
  }

  int total = 0;
  int nn = 5;

  for (int i = 1; i <= nn; i++) {
    total = total + i; //1 , 3 , 6 , 10 , 15
  }

  print("Total is $total");

  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      break;
    }
    print(i);
  }

  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      continue;
    }
    print(i);
  }
  print("step");
  for (var i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (j == 2) {
        break;
      }
      print(j);
    }
    print(i);
  }

  List ages = [10, 15, 13, 28, "41"];
  print(ages);
  print(ages[0]);
  print(ages[4]);

  print(ages[ages.length - 1]);
  print(ages.last);

  List<int> ages0 = [10, 15, 13, 28];
  print(ages0);

  int allTotal = 0;
  for (int i = 0; i < ages0.length; i++) {
    allTotal = allTotal + ages0[i];
  }
  print(allTotal);

  ages0.add(15);

  allTotal = 0;
  for (int i = 0; i < ages0.length; i++) {
    allTotal = allTotal + ages0[i];
  }
  print(allTotal);

  print(ages0.indexOf(15));

  for (int i = 0; i < ages0.length; i++) {
    if (ages0[i] == 15) {
      print(i);
      break;
    }
  }

  print(ages0.indexOf(26));

  print(ages0.isEmpty);
  print(ages0.isNotEmpty);

  ages0.insert(1, 25);
  print(ages0);
  print(ages0.reversed);

  List<int> ages1 = [2, 5, 8];
  ages0.addAll(ages1);
  print(ages0);
  ages0.insertAll(1, ages1);
  print(ages0);

  List ages2 = [2, 5, 8];
  print(ages2);
  ages2.insert(1, [2, (num33 < num11 ? 10 : 0), 4, 5]);
  print(ages2);

  print(ages0);
  // ages0.removeRange(1, 4);
  print(ages0);
  ages0.removeRange(ages0.indexOf(2), ages0.indexOf(8) + 1); //ass
  print(ages0);

  /* 
    *    
   ***   
  *****  
 ******* 
*********
   */

  Map m = {
    'name': 'Ahmad',
    'Lname': 'Omar',
    'age': 25,
    'ages': [25, 15, 24],
  };
  print(m['name']);
  print(m.values);
  print(m.keys);
  print(m.length);
  print(m['ages'][1]);
  m['ages'].add(11);
  print(m);
  m['name'] = 'Obada';
  m.remove('Lname');
  print(m);
  m['fName'] = 'K';
  print(m);

  Map expenses = {
    'sun': 3000.0,
    'mon': 3000.0,
    'tue': 3234.0,
  };

  List arr1 = expenses.values.toList();
  print(arr1);

  print(expenses.containsValue(3232));
}
