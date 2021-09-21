class TrendGelir {
  String? text;
  double? value;

  TrendGelir({this.text, this.value});

  factory TrendGelir.fromJson(Map<String, dynamic> json) => TrendGelir(
        text: json['text'] as String?,
        value: json['value'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'value': value,
      };
}
