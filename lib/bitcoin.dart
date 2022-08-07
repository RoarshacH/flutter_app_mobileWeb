import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'models/coin.dart';
import 'util/coinCard.dart';

class BitcoinWidget extends StatefulWidget {
  const BitcoinWidget({Key? key}) : super(key: key);

  @override
  State<BitcoinWidget> createState() => _BitcoinWidgetState();
}

class _BitcoinWidgetState extends State<BitcoinWidget> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }

  Widget getTextWidgets() {
    List<Widget> childrenList = [];

    for (var item in coinList) {
      var card = CoinCard(
        name: item.name,
        imageUrl: item.imageUrl,
        price: item.price.toDouble(),
        changePercentage: item.changePercentage.toDouble(),
      );
      childrenList.add(card);
    }
    Widget coinColumn = Column(children: childrenList);
    return coinColumn;
  }

  @override
  Widget build(BuildContext context) {
    const textCol = Color(0xff82204a);
    const textHeadCol = Color.fromARGB(255, 56, 26, 56);
    const borderCol = Color(0xFF558c8c);
    return Container(
        decoration: BoxDecoration(border: Border.all(color: borderCol)),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
              margin: const EdgeInsets.all(10.0),
              child: const Text(
                "Bitcoin Prices",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: textHeadCol,
                    decoration: TextDecoration.underline),
              )),
          getTextWidgets()
        ]));
  }
}
