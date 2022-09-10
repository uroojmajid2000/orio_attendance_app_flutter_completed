import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Splash/splash_screen.dart';
import 'package:orio_attendance_app_flutter/shared/providers/bloc_providers.dart';
import 'package:orio_attendance_app_flutter/shared/providers/repository_providers.dart';
import 'package:orio_attendance_app_flutter/shared/route_aware/route_observer.dart';
import 'package:orio_attendance_app_flutter/shared/routes/routes.dart';
import 'package:orio_attendance_app_flutter/shared/theme/theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiRepositoryProvider(
      providers: RepositoryProviders.providers,
      child: MultiBlocProvider(
        providers: BlocProviders.providers,
        child: MaterialApp(
          title: 'Orio Attendance',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData(),
          initialRoute: SplashScreen.id,
          routes: Routes.routes,
          navigatorObservers: [routeObserver],
        ),
      ),
    );
  }
}
