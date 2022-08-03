import 'package:flutter/material.dart';
import 'package:startup_namer/currentWeather.dart';
import 'package:startup_namer/randomWords.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random(); // Add this line.
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Welcome to Flutter'),
//         ),
//         body: Center(                          // Drop the const, and
//           //child: Text('Hello World'),        // Replace this text...
//           child: Text(wordPair.asPascalCase),  // With this text.
//         ),
//       ),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();  // DELETE

    // return MaterialApp(
    //   title: 'Welcome to Flutter',
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Welcome to Flutter'),
    //     ),
    //     body: const Center(                     // Add the const
    //       //child: Text(wordPair.asPascalCase), // REPLACE with...
    //       child: RandomWords(),                 // ...this line
    //     ),
    //   ),
    // );
    return MaterialApp(
        title: 'Startup Name Generator',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Startup Name Generator'),
          ),
          body: const Center(
            child: CurrentWeatherPage(),
          ),
        ));
  }
}
