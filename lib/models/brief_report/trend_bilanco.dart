class TrendBilanco {
  String? text;
  double? value;

  TrendBilanco({this.text, this.value});

  factory TrendBilanco.fromJson(Map<String, dynamic> json) => TrendBilanco(
        text: json['text'] as String?,
        value: json['value'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'value': value,
      };
}
