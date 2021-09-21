class DonutGraphicModel {
  String? title;
  double? value1;
  double? value2;

  DonutGraphicModel({this.title, this.value1, this.value2});

  factory DonutGraphicModel.fromJson(Map<String, dynamic> json) =>
      DonutGraphicModel(
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
