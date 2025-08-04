import 'dart:convert';

import 'package:flutter_location_search_app/data/model/location.dart';
import 'package:flutter_test/flutter_test.dart';

// test 파일
void main() {
  test('test', () {
    String dummy = """
{
  "title": "<b>새진흥</b>8차아파트",
  "link": "",
  "category": "주택>아파트",
  "description": "",
  "telephone": "",
  "address": "경상남도 양산시 평산동 46-1",
  "roadAddress": "경상남도 양산시 신명2길 16-33",
  "mapx": "1291503508",
  "mapy": "353861303"
}
""";
    // 1. Map으로 변환
    Map<String, dynamic> map = jsonDecode(dummy);

    // 2. 객체로 변환
    Location location = Location.fromJson(map);

    // 3. test실행 (기대값, 실제값)
    expect(location.roadAddress, "경상남도 양산시 신명2길 16-33");
  });
}
