class BistIndices {
  String? aciklama;
  String? dunkukapanis;
  String? acilis;
  String? son;

  BistIndices({this.aciklama, this.dunkukapanis, this.acilis, this.son});

  factory BistIndices.fromJson(Map<String, dynamic> json) => BistIndices(
        aciklama: json['aciklama'] as String?,
        dunkukapanis: json['dunkukapanis'] as String?,
        acilis: json['acilis'] as String?,
        son: json['son'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'aciklama': aciklama,
        'dunkukapanis': dunkukapanis,
        'acilis': acilis,
        'son': son,
      };
}
