class Person {
  String name;
  int age;
  double height;

  Person(this.name, this.age, this.height);

  void printDescription() {
    print(
        "My name is ${this.name}. I'm ${this.age} years old, I'm ${this.height} meters tall.");
  }
}

void main() {
  Person p1 = Person('hero', 20, 1.71);
  p1.printDescription();
  Person p2 = Person('few', 21, 1.76);
  p2.printDescription();
}
