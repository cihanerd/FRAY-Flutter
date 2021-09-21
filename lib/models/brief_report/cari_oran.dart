class CariOran {
  String? companyCode;
  String? companyName;
  String? mainCategory;
  String? subCategory;
  String? title;
  double? currentMainCategoryAverage;
  double? previousMainCategoryAverage;
  double? currentSubCategoryAverage;
  double? previousSubCategoryAverage;
  double? currentTitleValue;
  double? previousTitleValue;

  CariOran({
    this.companyCode,
    this.companyName,
    this.mainCategory,
    this.subCategory,
    this.title,
    this.currentMainCategoryAverage,
    this.previousMainCategoryAverage,
    this.currentSubCategoryAverage,
    this.previousSubCategoryAverage,
    this.currentTitleValue,
    this.previousTitleValue,
  });

  factory CariOran.fromJson(Map<String, dynamic> json) => CariOran(
        companyCode: json['companyCode'] as String?,
        companyName: json['companyName'] as String?,
        mainCategory: json['mainCategory'] as String?,
        subCategory: json['subCategory'] as String?,
        title: json['title'] as String?,
        currentMainCategoryAverage:
            json['currentMainCategoryAverage'] as double?,
        previousMainCategoryAverage:
            json['previousMainCategoryAverage'] as double?,
        currentSubCategoryAverage: json['currentSubCategoryAverage'] as double?,
        previousSubCategoryAverage:
            json['previousSubCategoryAverage'] as double?,
        currentTitleValue: json['currentTitleValue'] as double?,
        previousTitleValue: json['previousTitleValue'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'companyCode': companyCode,
        'companyName': companyName,
        'mainCategory': mainCategory,
        'subCategory': subCategory,
        'title': title,
        'currentMainCategoryAverage': currentMainCategoryAverage,
        'previousMainCategoryAverage': previousMainCategoryAverage,
        'currentSubCategoryAverage': currentSubCategoryAverage,
        'previousSubCategoryAverage': previousSubCategoryAverage,
        'currentTitleValue': currentTitleValue,
        'previousTitleValue': previousTitleValue,
      };
}
