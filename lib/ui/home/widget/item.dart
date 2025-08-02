import 'package:flutter/material.dart';

Container item() {
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
          '삼성 1동 주민센터',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          '공공,사회기관',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
        ),
        SizedBox(height: 4),
        Text('서울턱별시 강남구', style: TextStyle(fontSize: 16)),
      ],
    ),
  );
}
