import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/product_screen.dart';
import 'screens/account_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm Exam',
      theme: ThemeData(

        //textTheme: GoogleFonts.latoTextTheme(),
        primaryColor: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/products': (context) => ProductScreen(),
        '/account': (context) => AccountScreen(),
      },
    );
  }
}
