import 'datas.dart';

class Ratios {
  String? title;
  List<Datas>? datas;

  Ratios({this.title, this.datas});

  factory Ratios.fromJson(Map<String, dynamic> json) => Ratios(
        title: json['title'] as String?,
        datas: (json['datas'] as List<dynamic>?)
            ?.map((e) => Datas.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'datas': datas?.map((e) => e.toJson()).toList(),
      };
}
