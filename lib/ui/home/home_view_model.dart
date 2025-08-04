import 'package:flutter_location_search_app/data/model/location.dart';
import 'package:flutter_location_search_app/data/repository/location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태 클래스 만들기
class HomeState {
  List<Location> locations = [];
  HomeState(this.locations);
}

// 2. 뷰모델 만들기 - Notifier 상속
class HomeViewModel extends Notifier<HomeState> {
  @override
  build() {
    return HomeState([]);
  }

  Future<void> searchLocation(String query) async {
    LocationRepository locationRepository = LocationRepository();
    final locations = await locationRepository.locationSearch(query);
    state = HomeState(locations);
  }
}

// 3. 뷰모델 관리자 만들기 - NotifierProvider 객체
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
