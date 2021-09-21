class Valuation {
  String? title;
  double? value;

  Valuation({this.title, this.value});

  factory Valuation.fromJson(Map<String, dynamic> json) => Valuation(
        title: json['title'] as String?,
        value: json['value'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'value': value,
      };
}
