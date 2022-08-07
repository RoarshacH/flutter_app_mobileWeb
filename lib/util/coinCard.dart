import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  CoinCard({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.changePercentage,
  });

  String name;
  String imageUrl;
  double price;
  double changePercentage;

  @override
  Widget build(BuildContext context) {
    const textCol = Color(0xff82204a);
    const borderCol = Color(0xFF558c8c);

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: borderCol),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: textCol,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${price.toDouble().toString()}",
                    style: const TextStyle(
                      color: textCol,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    changePercentage.toDouble() < 0
                        ? '${changePercentage.toDouble()}%'
                        : '+${changePercentage.toDouble()}%',
                    style: TextStyle(
                      color: changePercentage.toDouble() < 0
                          ? Colors.red
                          : Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
