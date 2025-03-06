import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'hide EmailAuthProvider;

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [EmailAuthProvider()],
      actions: [
        AuthStateChangeAction<UserCreated>((context, state) {
          if (FirebaseAuth.instance.currentUser != null) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        }),
        AuthStateChangeAction<SignedIn>((context, state) {
          if (FirebaseAuth.instance.currentUser != null) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        }),
      ],
      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset('assets/images/flutterfire_300x.png'),
          ),
        );
      },
    );
  }
}