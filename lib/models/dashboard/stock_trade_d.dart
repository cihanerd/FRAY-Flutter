class StockTradeData {
  String? aciklama;
  String? acilis;
  String? son;
  String? simge;
  String? sembol;
  String? gunlukyuzde;
  String? type;

  StockTradeData({
    this.aciklama,
    this.acilis,
    this.son,
    this.simge,
    this.sembol,
    this.gunlukyuzde,
    this.type,
  });

  factory StockTradeData.fromJson(Map<String, dynamic> json) => StockTradeData(
        aciklama: json['aciklama'] as String?,
        acilis: json['acilis'] as String?,
        son: json['son'] as String?,
        simge: json['simge'] as String?,
        sembol: json['sembol'] as String?,
        gunlukyuzde: json['gunlukyuzde'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'aciklama': aciklama,
        'acilis': acilis,
        'son': son,
        'simge': simge,
        'sembol': sembol,
        'gunlukyuzde': gunlukyuzde,
        'type': type,
      };
}
