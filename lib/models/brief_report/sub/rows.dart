class Rows {
  String? label;
  List<dynamic>? values;
  dynamic quarterValues;

  Rows({this.label, this.values, this.quarterValues});

  factory Rows.fromJson(Map<String, dynamic> json) => Rows(
        label: json['label'] as String?,
        values: json['values'] as List<dynamic>?,
        quarterValues: json['quarter_values'],
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'values': values,
        'quarter_values': quarterValues,
      };
}
