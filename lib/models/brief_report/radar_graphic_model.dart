class RadarGraphicModel {
  String? title;
  double? value;

  RadarGraphicModel({this.title, this.value});

  factory RadarGraphicModel.fromJson(Map<String, dynamic> json) =>
      RadarGraphicModel(
        title: json['title'] as String?,
        value: json['value'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'value': value,
      };
}
