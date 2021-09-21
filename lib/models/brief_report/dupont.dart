class Dupont {
  String? text;
  double? value1;
  double? value2;

  Dupont({this.text, this.value1, this.value2});

  factory Dupont.fromJson(Map<String, dynamic> json) => Dupont(
        text: json['text'] as String?,
        value1: json['value1'] as double?,
        value2: json['value2'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'value1': value1,
        'value2': value2,
      };
}
