import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/currentWeather.dart';
import 'package:startup_namer/signIn.dart';
import 'package:startup_namer/triviaWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Flutter App'),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 15.0,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: logout(context), child: const Text('Logout'))),
            const SizedBox(
              height: 15.0,
            ),
            const Center(child: CurrentWeatherPage()),
            const SizedBox(
              height: 15.0,
            ),
            const Center(child: TriviaWidget()),
          ],
        ));
  }
}

logout(context) {
  FirebaseAuth.instance.signOut().then((value) => {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInWidget()),
        )
      });
}
