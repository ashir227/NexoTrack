import 'package:hive/hive.dart';

part 'portfolio_model.g.dart';

@HiveType(typeId: 0)
class PortfolioModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final double qty;

  @HiveField(2)
  final double buyPrice;

  @HiveField(3)
  final double totalinvest;

  PortfolioModel({
    required this.name,
    required this.qty,
    required this.buyPrice,
    required this.totalinvest,
  });
}
