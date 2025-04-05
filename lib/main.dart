import 'dart:io';

import 'package:abayati/features/screens/onboard/dashboard/nav/state/nav_cubit.dart';
import 'package:abayati/features/utils/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'features/utils/app_route.dart';
import 'features/utils/components/app_globals.dart';
import 'features/utils/const.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initSingletons();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness:
        Platform.isAndroid ? Brightness.dark : Brightness.light,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const AbayatiApp());
}

class AbayatiApp extends StatelessWidget {
  const AbayatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<NavCubit>(create: (_) => NavCubit())],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Abayati',
          theme: AppThemeData.appThemeData(context),
          navigatorKey: navigatorKey,
          initialRoute: AppRoute.splash,
          routes: AppRoute.routes,
        ),
      ),
    );
  }
}
