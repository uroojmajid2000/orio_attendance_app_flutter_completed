part of '../attendance_screen.dart';

bool isRoute = true;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends RouteAwareState<Body> {
  bool isInRange = false;

  void start() async {
    List<Station> stations = context.read<StationCubit>().state.stations;

    while (isRoute) {
      Position? position;
      bool isFound = false;
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).then((Position pos) {
        position = pos;
      }).catchError((e) {});
      double distanceInMeters = 0.0;
      for (var station in stations) {
        distanceInMeters = Geolocator.distanceBetween(
          position?.latitude ?? 0,
          position?.longitude ?? 0,
          double.parse(station.latitude),
          double.parse(station.longtitude),
        );
        if (distanceInMeters <= station.radius) {
          isFound = true;
        }
      }
      if (isInRange != isFound) {
        setState(() {
          isInRange = isFound;
        });
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void didPush() {
    isRoute = true;
    start();
  }

  @override
  void didPopNext() {
    isRoute = true;
    start();
  }

  @override
  void didPushNext() {
    isRoute = false;
  }

  @override
  void dispose() {
    isRoute = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: kDefaultPadding,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () =>
                      Navigate.to(context, AttendanceDataScreen.id),
                  icon: SvgPicture.asset('assets/icons/calender.svg')),
            ),
          ),
          const DateTimeShow(),
          const SizedBox(height: 20),
          AttendanceButton(isInRange: isInRange),
          const SizedBox(height: 20),
          InRangeText(isInRange: isInRange),
          const Expanded(child: SizedBox(height: 20)),
          const AttendanceInfo(),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
