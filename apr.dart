/* void main() {
  int rows = 7;
  for (int i = 1; i <= rows; i++) {
    String spaces = "";
    String stars = "";

    for (int j = i; j < rows; j++) {
      spaces += " ";
    }

    for (int k = 1; k <= (2 * i - 1); k++) {
      stars += "*";
    }

    print(spaces + stars + spaces);
  }
  calculate(9, 6);
  calculate2(9, num2: 5);
  userData(
    name: 10,
    cPAssword: "",
    email: false,
  );
  printName("Omar");

  print(sum(2, 8));
  print(sum2(3, 8));

  Car car = Car("BMW");

  car.printCarData("BLUE", "NISSAN");
  car.type = "Nissan";
  car.color = "RED";
  car.printCarData("BLUE", "NISSAN");
}

void printName(String lName) {
  String name = "Ahmad";
  print("Hello Im $name $lName");
}

calculate(int num1, [int num2 = 5]) {
  print(num1 + num2);
}

calculate2(int num1, {int num2 = 5}) {
  print(num1 + num2);
}

userData({required name, password, cPAssword, fName, email, lName}) {
  return "";
}

dynamic printInfo(String name, String gender, [String title = "sir/ma'am"]) {
  print("Hello $title $name your gender is $gender.");
  return 50;
}

int sum(int num1, int num2) {
  int total = num1 + num2;
  return total;
}

int sum2(int num1, int num2) => num1 + num2;

class Car {
  String color = "RED";
  String type = "";

  Car(type) {
    this.type = type;
  }

  void printCarData(colorP, typeP) {
    print("Car Type = $type \nCar Color = $colorP");
  }
}
 */

class Car {
  String? name;

  void test() {
    if (name != null) {
      String x = name.toString();
      x += "1";
      print(x);
    }
    String x = name ?? "null";
    x += "1";
    print(x);
  }

  // Constant Constructor
}

void main() {
  Car c = Car();
  c.test();
}
//null safety