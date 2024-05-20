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
}
