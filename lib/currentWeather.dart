import 'dart:async';

import 'package:flutter/material.dart';
import 'models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  late Weather _weather;

  @override
  void initState() {
    getCurrentWeather();
    Timer.periodic(
        const Duration(seconds: 300), (timer) => getCurrentWeather());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot != null) {
          this._weather = snapshot.data as Weather;
          if (this._weather == null) {
            return Text("Error getting weather");
          } else {
            return weatherBox(_weather);
          }
        } else {
          return CircularProgressIndicator();
        }
      },
      future: getCurrentWeather(),
    );
  }
}

Widget weatherBox(Weather _weather) {
  const textCol = Color(0xff82204a);
  const textHeadCol = Color(0xff231123);
  return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
    Container(
        margin: const EdgeInsets.all(10.0),
        child: const Text(
          "Weather",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: textHeadCol,
              decoration: TextDecoration.underline),
        )),
    Container(
        margin: const EdgeInsets.all(10.0),
        child: Text(
          "${_weather.temp}°C",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 55, color: textCol),
        )),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text(
          _weather.description,
          style: const TextStyle(color: textCol),
        )),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text("Feels:${_weather.feelsLike}°C",
            style: const TextStyle(color: textCol))),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text("H:${_weather.high}°C L:${_weather.low}°C",
            style: const TextStyle(color: textCol))),
  ]);
}

Future getCurrentWeather() async {
  late Weather weather; // change
  // String city = "calgary";
  // String apiKey = "YOUR_API_KEY";
  var url =
      "https://api.openweathermap.org/data/2.5/weather/?lat=44.389355&lon=-79.690331&units=metric&APPID=92ad8d24c25849a4bd4e688a9a31031e";

  final response = await http.get(url);

  if (response.statusCode == 200) {
    weather = Weather.fromJson(jsonDecode(response.body));
  }

  return weather;
}
