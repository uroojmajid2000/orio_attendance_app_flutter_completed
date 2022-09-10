// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'station_cubit.dart';

class StationState extends Equatable {
  final List<Station> stations;

  const StationState({
    required this.stations,
  });

  factory StationState.initial() => const StationState(stations: []);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [stations];

  StationState copyWith({
    List<Station>? stations,
  }) {
    return StationState(
      stations: stations ?? this.stations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stations': stations.map((x) => x.toMap()).toList(),
    };
  }

  factory StationState.fromMap(Map<String, dynamic> map) {
    return StationState(
      stations: List<Station>.from(
        (map['stations'] as List).map<Station>(
          (x) => Station.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory StationState.fromJson(String source) =>
      StationState.fromMap(json.decode(source) as Map<String, dynamic>);
}
