import 'package:flutter/material.dart';
import 'package:flutter_location_search_app/ui/home/widget/item.dart';

class HomePage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100, // 앱바는 색상 따로 줘야함
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade100, // 앱바는 색상 따로 줘야함
        title: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true, // 배경을 채우기 위해 필요
            fillColor: Colors.white, // 색상 선택
            icon: Icon(Icons.search, color: Colors.black),
            hintText: '검색',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemBuilder: (BuildContext context, int index) {
          return item();
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 20);
        },
        itemCount: 10,
      ),
    );
  }
}
