class GaugeGraphicModel {
  String? title;
  double? value1;
  double? value2;

  GaugeGraphicModel({this.title, this.value1, this.value2});

  factory GaugeGraphicModel.fromJson(Map<String, dynamic> json) =>
      GaugeGraphicModel(
        title: json['title'] as String?,
        value1: json['value1'] as double?,
        value2: json['value2'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'value1': value1,
        'value2': value2,
      };
}
