class Coin {
  final String name;
  final String imageUrl;
  final num price;
  final num changePercentage;

  Coin({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.changePercentage,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      imageUrl: json['image'],
      price: json['current_price'],
      changePercentage: json['price_change_percentage_24h'],
    );
  }
}

List<Coin> coinList = [];
