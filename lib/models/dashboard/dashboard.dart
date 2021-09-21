import 'bist_indices.dart';
import 'stock_trade_d.dart';

class DashboardData {
  List<StockTradeData>? stockTradeM;
  List<StockTradeData>? stockTradeI;
  List<StockTradeData>? stockTradeD;
  List<BistIndices>? bistIndices;

  DashboardData({
    this.stockTradeM,
    this.stockTradeI,
    this.stockTradeD,
    this.bistIndices,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
        stockTradeM: (json['stockTradeM'] as List<dynamic>?)
            ?.map((e) => StockTradeData.fromJson(e as Map<String, dynamic>))
            .toList(),
        stockTradeI: (json['stockTradeI'] as List<dynamic>?)
            ?.map((e) => StockTradeData.fromJson(e as Map<String, dynamic>))
            .toList(),
        stockTradeD: (json['stockTradeD'] as List<dynamic>?)
            ?.map((e) => StockTradeData.fromJson(e as Map<String, dynamic>))
            .toList(),
        bistIndices: (json['bistIndices'] as List<dynamic>?)
            ?.map((e) => BistIndices.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'stockTradeM': stockTradeM?.map((e) => e.toJson()).toList(),
        'stockTradeI': stockTradeI?.map((e) => e.toJson()).toList(),
        'stockTradeD': stockTradeD?.map((e) => e.toJson()).toList(),
        'bistIndices': bistIndices?.map((e) => e.toJson()).toList(),
      };
}
