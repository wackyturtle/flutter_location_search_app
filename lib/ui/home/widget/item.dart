import 'package:flutter/material.dart';
import 'package:flutter_location_search_app/data/model/location.dart';

// HTML 태그 제거 '<b></b>'
String removeHtmlTags(String htmlText) {
  return htmlText.replaceAll(RegExp(r'<[^>]*>'), '');
}

Widget item(Location location) {
  return Container(
    padding: EdgeInsets.all(20),
    height: 140,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          removeHtmlTags(location.title),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          location.category,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
        ),
        SizedBox(height: 4),
        Text(location.roadAddress, maxLines: 1, style: TextStyle(fontSize: 16)),
      ],
    ),
  );
}
