class Favorites {
  String? code;
  String? kategori;
  String? name;
  String? adres;
  String? telefon;
  String? internet;
  String? email;
  String? sektor;
  String? pazar;
  String? endeksler;
  String? aciklik;
  String? longCode;
  String? radar;
  String? releasedAt;

  Favorites({
    this.code,
    this.kategori,
    this.name,
    this.adres,
    this.telefon,
    this.internet,
    this.email,
    this.sektor,
    this.pazar,
    this.endeksler,
    this.aciklik,
    this.longCode,
    this.radar,
    this.releasedAt,
  });

  factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
        code: json['code'] as String?,
        kategori: json['kategori'] as String?,
        name: json['name'] as String?,
        adres: json['adres'] as String?,
        telefon: json['telefon'] as String?,
        internet: json['internet'] as String?,
        email: json['email'] as String?,
        sektor: json['sektor'] as String?,
        pazar: json['pazar'] as String?,
        endeksler: json['endeksler'] as String?,
        aciklik: json['aciklik'] as String?,
        longCode: json['long_code'] as String?,
        radar: json['radar'] as String?,
        releasedAt: json['released_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'kategori': kategori,
        'name': name,
        'adres': adres,
        'telefon': telefon,
        'internet': internet,
        'email': email,
        'sektor': sektor,
        'pazar': pazar,
        'endeksler': endeksler,
        'aciklik': aciklik,
        'long_code': longCode,
        'radar': radar,
        'released_at': releasedAt,
      };
}
