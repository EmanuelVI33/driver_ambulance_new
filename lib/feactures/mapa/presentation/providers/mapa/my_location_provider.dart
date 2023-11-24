import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_location_provider.g.dart';

@riverpod
class MyLocation extends _$MyLocation {
  @override
  LatLng build() {
    return const LatLng(-17.783886, -63.181480);
  }

  update(LatLng myLocation) {
    state = myLocation;
  }
}
