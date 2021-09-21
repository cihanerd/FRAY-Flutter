import 'periods.dart';
import 'rows.dart';

class ADonenVarliklar {
  List<Periods>? periods;
  List<Rows>? rows;

  ADonenVarliklar({this.periods, this.rows});

  factory ADonenVarliklar.fromJson(Map<String, dynamic> json) =>
      ADonenVarliklar(
        periods: (json['periods'] as List<dynamic>?)
            ?.map((e) => Periods.fromJson(e as Map<String, dynamic>))
            .toList(),
        rows: (json['rows'] as List<dynamic>?)
            ?.map((e) => Rows.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'periods': periods?.map((e) => e.toJson()).toList(),
        'rows': rows?.map((e) => e.toJson()).toList(),
      };
}
