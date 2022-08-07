import 'package:flutter/material.dart';
import 'models/trivia.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TriviaWidget extends StatefulWidget {
  const TriviaWidget({super.key});

  @override
  _TriviaWidgetState createState() => _TriviaWidgetState();
}

class _TriviaWidgetState extends State<TriviaWidget> {
  late Trivia _trivia;
  bool _visible = false;
  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        // ignore: unnecessary_null_comparison
        if (snapshot != null) {
          _trivia = snapshot.data as Trivia;
          // ignore: unnecessary_null_comparison
          if (_trivia == null) {
            return Text("Error getting weather");
          } else {
            return triviaBox(_trivia, _visible, _toggle);
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
      future: getTrivia(),
    );
  }
}

Widget triviaBox(Trivia _trivia, bool visible, VoidCallback toggle) {
  const textCol = Color(0xff82204a);
  const textHeadCol = Color(0xff310c1c);
  const borderCol = Color(0xFF558c8c);

  return Container(
      decoration: BoxDecoration(border: Border.all(color: borderCol)),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text(
              "Quick Trivia",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: textHeadCol,
                  decoration: TextDecoration.underline),
            )),
        Container(
            margin: const EdgeInsets.all(5.0),
            child: Text(
              _trivia.category,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: textCol),
            )),
        Container(
            margin: const EdgeInsets.all(5.0),
            child: Text(
              "Dificulaty:${_trivia.difficulty}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: textCol),
            )),
        Center(
          child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Text(
                String.fromCharCodes(Runes(_trivia.question)),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18, fontStyle: FontStyle.italic, color: textCol),
              )),
        ),
        Container(
            margin: const EdgeInsets.all(5.0),
            child: Text(
              "Answer: ${_trivia.correctAnswer}",
              style: const TextStyle(color: textCol),
            )),
        ElevatedButton.icon(
          icon: const Icon(Icons.question_answer),
          label: const Text('Refresh'),
          onPressed: () {
            toggle();
          },
        ),
      ]));
}

Future getTrivia() async {
  late Trivia weather; // change

  var url_alt = 'https://opentdb.com/api.php?amount=1';
  final response = await http.get(url_alt);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    weather = Trivia.fromJson(data["results"][0]);
  }

  return weather;
}
