mixin Walker {
  void walk() {
    print('I can walk');
  }
}

mixin Runner {
  void run() {
    print('I can run');
  }
}

class Athlete with Walker, Runner {
  String name;
  int age;

  Athlete(this.name, this.age);

  @override
  void run() => print("$name is running.");

  @override
  void walk() => print("$name is walking.");
}

void main() {
  var athlete = Athlete("hero", 20);
  athlete.walk();
  athlete.run();
}
