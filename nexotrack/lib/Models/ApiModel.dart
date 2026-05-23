class CryptoModel {
  final String name;
  final double price;
  final double change24h;

  CryptoModel({
    required this.name,
    required this.price,
    required this.change24h,
  });

  factory CryptoModel.fromJson(String name, Map<String, dynamic> json) {
    return CryptoModel(
      name: name,
      price: (json['usd'] ?? 0).toDouble(),
      change24h: (json['usd_24h_change'] ?? 0).toDouble(),
    );
  }
}
