import 'dart:async';
import 'dart:isolate';

import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/station_entitiy.dart';

class PortParams {
  final SendPort sendPort;
  final List<Station> stations;
  Timer? timer;

  PortParams(this.sendPort, this.stations, this.timer);
}
