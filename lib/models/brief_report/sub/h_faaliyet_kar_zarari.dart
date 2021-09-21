import 'periods.dart';
import 'rows.dart';

class HFaaliyetKarZarari {
  List<Periods>? periods;
  List<Rows>? rows;

  HFaaliyetKarZarari({this.periods, this.rows});

  factory HFaaliyetKarZarari.fromJson(Map<String, dynamic> json) =>
      HFaaliyetKarZarari(
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
