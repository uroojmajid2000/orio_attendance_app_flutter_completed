import 'package:orio_attendance_app_flutter/features/attendance/data/model/station_model.dart';
import 'package:orio_attendance_app_flutter/shared/network/network.dart';

class StationRemoteDataSource {
  Future<List<StationModel>> get(String token) async {
    try {
      final res = await NetworkHelper.request(
        url: 'attendance-app/employee',
        token: token,
      );

      List<StationModel> stations = res[0]['employee_station']
          .map<StationModel>((json) => StationModel.fromJson(json['station']))
          .toList();

      return stations;
    } catch (e) {
      rethrow;
    }
  }
}
