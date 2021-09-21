import 'datas.dart';

class Varlik {
  String? title;
  List<Datas>? datas;

  Varlik({this.title, this.datas});

  factory Varlik.fromJson(Map<String, dynamic> json) => Varlik(
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
