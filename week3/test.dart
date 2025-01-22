// ● Write a program in a dart to create an age variable and assign a null value to it
// using ?
// ● Write a function that accepts a nullable int parameter and returns 0 if the value is
// null using operator ??

import 'dart:io';

int? nullAware(int? age) {
  return age ?? 0;
}

void main() {
  print("Enter age:");
  String? text = stdin.readLineSync();
  if (text == null) {
    text = "";
  }
  print(text.toString());
  // int? age = int.parse(text);
  // print("Age is: ${nullAware(age).toString()}");
}
