import 'package:equatable/equatable.dart';

class Station extends Equatable {
  final String longtitude, latitude;
  final int radius;

  const Station({
    required this.longtitude,
    required this.latitude,
    required this.radius,
  });

  factory Station.initial() => const Station(
        longtitude: '',
        latitude: '',
        radius: 0,
      );

  @override
  List<Object> get props => [longtitude, latitude, radius];

  @override
  bool get stringify => true;

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      longtitude: json['longtitude'],
      latitude: json['latitude'],
      radius: json['radius'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'longitude': longtitude,
      'latitude': latitude,
      'radius': radius,
    };
  }

  factory Station.fromMap(Map<String, dynamic> map) {
    return Station(
      longtitude: map['longitude'],
      latitude: map['latitude'],
      radius: map['radius'] as int,
    );
  }
}
