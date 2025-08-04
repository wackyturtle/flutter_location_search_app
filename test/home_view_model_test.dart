import 'package:flutter_location_search_app/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ViewModel test', () async {
    // 앱 내에서는 ProviderScope 안에서 뷰모델을 관리
    // 테스트 환경에서 Widget을 생성하지 않고 테스트 할 수 있게 ProviderContainer 제공
    final providerContainer = ProviderContainer();
    addTearDown(providerContainer.dispose);
    final homeVm = providerContainer.read(homeViewModelProvider.notifier);
    //처음 HomeViewModel의 상태 => 빈 리스트 연결 테스트
    final firstState = providerContainer.read(homeViewModelProvider);
    expect(firstState.locations?.isEmpty, true);

    // HomeViewModel에서 serachLocation 메서드 호출 후 상태가 변경이 정상적으로 되는지 테스트
    await homeVm.searchLocation('새진흥 7차');
    final afterState = providerContainer.read(homeViewModelProvider);
    expect(afterState.locations?.isEmpty, false);

    afterState.locations?.forEach((element) {
      print(element.toJson());
    });
  });
}
