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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot != null) {
          this._trivia = snapshot.data as Trivia;
          if (this._trivia == null) {
            return Text("Error getting weather");
          } else {
            return triviaBox(_trivia);
          }
        } else {
          return CircularProgressIndicator();
        }
      },
      future: getTrivia(),
    );
  }
}

Widget triviaBox(Trivia _trivia) {
  return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
    Container(
        margin: const EdgeInsets.all(10.0),
        child: const Text(
          "Quick Trivia",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
        )),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text("Category: ${_trivia.category}")),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text("Dificulaty:${_trivia.difficulty}")),
    Center(
      child: Container(
          margin: const EdgeInsets.all(5.0),
          child: Text(
              "Question:${String.fromCharCodes(Runes(_trivia.question))}")),
    ),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text("Answer: ${_trivia.correctAnswer}")),
  ]);
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
