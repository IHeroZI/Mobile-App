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
  int? age = int.tryParse(stdin.readLineSync()!);
  print("Age is: ${nullAware(age).toString()}");
}
