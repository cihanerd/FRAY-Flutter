class Periods {
  int? year;
  int? month;
  String? consolidation;
  String? currency;

  Periods({this.year, this.month, this.consolidation, this.currency});

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        year: json['year'] as int?,
        month: json['month'] as int?,
        consolidation: json['consolidation'] as String?,
        currency: json['currency'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
        'consolidation': consolidation,
        'currency': currency,
      };
}
