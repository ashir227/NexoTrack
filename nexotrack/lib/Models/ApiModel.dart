class CryptoModel {
  String id;
  String name;
  String symbol;
  double price;
  double change24h;
  String? image;

  CryptoModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change24h,
    this.image,
  });
}
