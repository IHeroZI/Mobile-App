import 'dart:math';

abstract class Shape {
  double get area;
  double get perimeter;
  void printValues();
}

class Square extends Shape {
  Square(this.side);
  final double side;
  @override
  double get area => side * side;
  @override
  double get perimeter => 4 * side;
  @override
  void printValues() =>
      print("area = ${this.area}\nperimeter = ${this.perimeter}");
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;
  @override
  double get area => pi * radius * radius;
  @override
  double get perimeter => 2 * pi * radius;
  @override
  void printValues() =>
      print("area = ${this.area}\nperimeter = ${this.perimeter}");
}

void main() {
  List<Shape> shapes = [Square(5), Circle(7)];

  for (var shape in shapes) {
    shape.printValues();
    print('---------');
  }
}