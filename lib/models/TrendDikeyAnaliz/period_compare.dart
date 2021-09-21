class PeriodCompare {
  String? title;
  String? value;
  String? consolidation;
  String? currency;

  PeriodCompare({
    this.title,
    this.value,
    this.consolidation,
    this.currency,
  });

  factory PeriodCompare.fromJson(Map<String, dynamic> json) => PeriodCompare(
        title: json['title'] as String?,
        value: json['value'] as String?,
        consolidation: json['consolidation'] as String?,
        currency: json['currency'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'value': value,
        'consolidation': consolidation,
        'currency': currency,
      };
}
