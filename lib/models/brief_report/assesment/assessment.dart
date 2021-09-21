import 'datas.dart';

class Assessment {
  String? title;
  List<Datas>? datas;

  Assessment({this.title, this.datas});

  factory Assessment.fromJson(Map<String, dynamic> json) => Assessment(
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
