class Feed {
  String? guid;
  String? title;
  String? link;

  Feed({this.guid, this.title, this.link});

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        guid: json['guid'] as String?,
        title: json['title'] as String?,
        link: json['link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'guid': guid,
        'title': title,
        'link': link,
      };
}
