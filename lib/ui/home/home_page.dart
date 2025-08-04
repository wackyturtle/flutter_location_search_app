import 'package:flutter/material.dart';
import 'package:flutter_location_search_app/ui/home/home_view_model.dart';
import 'package:flutter_location_search_app/ui/home/widget/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose(); // 원래 dispose도 호출해줘야함
  }

  void onSearch(String text) {
    // TODO 홈뷰모델의 searchlocation 메서드 호출
    ref.read(homeViewModelProvider.notifier).searchLocation(text);
    print('searchlocation 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100, // 앱바는 색상 따로 줘야함
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade100, // 앱바는 색상 따로 줘야함
        title: TextField(
          controller: controller,
          onSubmitted: onSearch,
          maxLines: 1,
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
          final location = homeState.locations[index];
          return item(location);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 20);
        },
        itemCount: homeState.locations.length,
      ),
    );
  }
}
