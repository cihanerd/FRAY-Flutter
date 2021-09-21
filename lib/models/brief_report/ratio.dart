class Ratio {
  double? stockPrice;
  double? stockEarning;
  double? fk;
  double? peg;
  int? marketValue;
  double? pddd;
  int? firmValue;
  double? fdfavok;
  double? fdSellings;
  int? paidInCapital;
  int? netDebt;

  Ratio({
    this.stockPrice,
    this.stockEarning,
    this.fk,
    this.peg,
    this.marketValue,
    this.pddd,
    this.firmValue,
    this.fdfavok,
    this.fdSellings,
    this.paidInCapital,
    this.netDebt,
  });

  factory Ratio.fromJson(Map<String, dynamic> json) => Ratio(
        stockPrice: json['stockPrice'] as double?,
        stockEarning: json['stockEarning'] as double?,
        fk: json['fk'] as double?,
        peg: json['peg'] as double?,
        marketValue: json['marketValue'] as int?,
        pddd: json['pddd'] as double?,
        firmValue: json['firmValue'] as int?,
        fdfavok: json['fdfavok'] as double?,
        fdSellings: json['fdSellings'] as double?,
        paidInCapital: json['paidInCapital'] as int?,
        netDebt: json['netDebt'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'stockPrice': stockPrice,
        'stockEarning': stockEarning,
        'fk': fk,
        'peg': peg,
        'marketValue': marketValue,
        'pddd': pddd,
        'firmValue': firmValue,
        'fdfavok': fdfavok,
        'fdSellings': fdSellings,
        'paidInCapital': paidInCapital,
        'netDebt': netDebt,
      };
}
