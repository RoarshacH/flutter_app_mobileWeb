import 'package:flutter/material.dart';
import 'package:startup_namer/currentWeather.dart';
import 'package:startup_namer/randomWords.dart';
import 'package:startup_namer/triviaWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('My Flutter App'),
            ),
            body: Column(
              children: const <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Center(child: CurrentWeatherPage()),
                SizedBox(
                  height: 15.0,
                ),
                Center(child: TriviaWidget()),
              ],
            )));
  }
}
