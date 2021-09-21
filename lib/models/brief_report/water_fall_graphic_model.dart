class WaterFallGraphicModel {
  String? text;
  int? value;

  WaterFallGraphicModel({this.text, this.value});

  factory WaterFallGraphicModel.fromJson(Map<String, dynamic> json) =>
      WaterFallGraphicModel(
        text: json['text'] as String?,
        value: json['value'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'value': value,
      };
}
