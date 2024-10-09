import 'package:flutter_map/flutter_map.dart';

class CustomMarker extends Marker {
  const CustomMarker({
    required super.point,
    required super.child,
    super.height = 40,
    super.width = 70,
  });
}
