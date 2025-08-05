import 'dart:convert';

import 'package:flutter_location_search_app/data/model/location.dart';
import 'package:http/http.dart';

class LocationRepository {
  Future<List<Location>> locationSearch(String query) async {
    final client = Client();
    final response = await client.get(
      Uri.parse(
        'https://openapi.naver.com/v1/search/local.json?query=$query&display=5',
      ),
      headers: {
        'X-Naver-Client-Id': 'BqAse7Ow7K0ejyK5Vkpn',
        'X-Naver-Client-Secret': '9TkpcRvkqU',
      },
    );

    // Get 요청 시 성공 => 200
    // 응답코드가 200일 때
    // body 데이터를 jsonDecode 함수 사용해서 map으로 바꾼 후 List<location>로 반환
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);
      final iterable = items.map((e) {
        return Location.fromJson(e);
      });

      final list = iterable.toList();
      return list;
    }
    // 아닐때 빈 리스트 반환
    return [];
  }
}
