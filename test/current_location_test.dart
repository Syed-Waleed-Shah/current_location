import 'package:flutter_test/flutter_test.dart';

import 'package:current_location/current_location.dart';

void main() {
  test('gets current location of user', () async {
    CurrentLocationInfo info = await CurrentLocation.get();
    print(info.toJson());
  });
}
