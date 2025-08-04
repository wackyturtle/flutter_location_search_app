import 'package:flutter_location_search_app/data/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('repository test', () async {
    LocationRepository locationRepository = LocationRepository();

    final location = await locationRepository.locationSearch('새진흥 7차');
    expect(location.isEmpty, false);
    for (var local in location) {
      print(local.toJson());
    }
  });
}
