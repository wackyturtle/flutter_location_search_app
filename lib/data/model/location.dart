// {
//   "lastBuildDate": "Mon, 04 Aug 2025 15:09:00 +0900",
//   "total": 1,
//   "start": 1,
//   "display": 1,
//   "items": [
//     {
//       "title": "<b>새진흥</b>8차아파트",
//       "link": "",
//       "category": "주택>아파트",
//       "description": "",
//       "telephone": "",
//       "address": "경상남도 양산시 평산동 46-1",
//       "roadAddress": "경상남도 양산시 신명2길 16-33",
//       "mapx": "1291503508",
//       "mapy": "353861303"
//     }
//   ]
// }

// 1. 모델 만들기
class Location {
  String title;
  String category;
  String roadAddress;

  Location({
    required this.title,
    required this.category,
    required this.roadAddress,
  });

  // 2. fromJson 만들기
  Location.fromJson(Map<String, dynamic> map)
    : this(
        title: map['title'],
        category: map['category'],
        roadAddress: map['roadAddress'],
      );

  // 3. toJson 만들기
  Map<String, dynamic> toJson() {
    return {"title": title, "category": category, "roadAddress": roadAddress};
  }
}
