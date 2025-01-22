/*
● Generate a random number between 1 and 100.
● Ask the user to guess the number, then tell them whether they guessed too
low, too high, or exactly right.
● Keep track of how many guesses the user has taken, and when the game
ends, print this out.
*/
import 'dart:io';
import 'dart:math';

void main() {
  var target = Random().nextInt(100) + 1;
  print("target: $target");

  int count = 1;
  while (true) {
    print("Enter number:");
    int? number = int.parse(stdin.readLineSync()!);
    if (number > target) {
      print("too high");
      count++;
    } else if (number < target) {
      print("too low");
      count++;
    } else {
      print("exactly right");
      print("guesses count = ${count}");
      break;
    }
  }
}
