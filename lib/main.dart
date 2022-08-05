import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/homePage.dart';
import 'package:startup_namer/signIn.dart';
import 'package:startup_namer/signUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: StreamBuilder<User?>(
    //     stream: FirebaseAuth.instance.authStateChanges(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return const SignInWidget();
    //       } else {
    //         return const HomePage();
    //       }
    //     },
    //   ),
    // );
    return const MaterialApp(title: 'Flutter App', home: SignInWidget());
  }
}
