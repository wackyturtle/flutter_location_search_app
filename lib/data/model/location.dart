// 1. 모델 만들기
class Location {
  String title;
  String category;
  String roadAddress;
  double mapX;
  double mapY;

  Location({
    required this.title,
    required this.category,
    required this.roadAddress,
    required this.mapX,
    required this.mapY,
  });

  // 2. fromJson 만들기
  Location.fromJson(Map<String, dynamic> map)
    : this(
        title: map['title'],
        category: map['category'],
        roadAddress: map['roadAddress'],
        mapX: double.parse(map['mapx']),
        mapY: double.parse(map['mapy']),
      );

  // 3. toJson 만들기
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "category": category,
      "roadAddress": roadAddress,
      "mapx": mapX,
      "mapy": mapY,
    };
  }
}
