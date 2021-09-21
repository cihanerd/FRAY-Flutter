class Datas {
  String? name;
  dynamic value1;
  dynamic value2;
  dynamic value3;
  dynamic value4;
  dynamic value5;

  Datas({
    this.name,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
  });

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        name: json['name'] as String?,
        value1: json['value1'],
        value2: json['value2'],
        value3: json['value3'],
        value4: json['value4'],
        value5: json['value5'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value1': value1,
        'value2': value2,
        'value3': value3,
        'value4': value4,
        'value5': value5,
      };
}
