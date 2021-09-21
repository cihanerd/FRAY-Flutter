class Datas {
  String? textS;
  String? text;
  bool? isPositive;

  Datas({this.textS, this.text, this.isPositive});

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        textS: json['textS'] as String?,
        text: json['text'] as String?,
        isPositive: json['isPositive'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'textS': textS,
        'text': text,
        'isPositive': isPositive,
      };
}
