class Datas {
  String? name;
  double? currentPeriodValue;
  double? previousPeriodValue;
  String? formula;
  String? currentPeriod;
  String? previousPeriod;

  Datas({
    this.name,
    this.currentPeriodValue,
    this.previousPeriodValue,
    this.formula,
    this.currentPeriod,
    this.previousPeriod,
  });

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        name: json['name'] as String?,
        currentPeriodValue: json['currentPeriodValue'] as double?,
        previousPeriodValue: json['previousPeriodValue'] as double?,
        formula: json['formula'] as String?,
        currentPeriod: json['currentPeriod'] as String?,
        previousPeriod: json['previousPeriod'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'currentPeriodValue': currentPeriodValue,
        'previousPeriodValue': previousPeriodValue,
        'formula': formula,
        'currentPeriod': currentPeriod,
        'previousPeriod': previousPeriod,
      };
}
