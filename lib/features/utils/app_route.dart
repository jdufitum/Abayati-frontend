import 'package:abayati/features/screens/onboard/auth/forgot_password.dart';
import 'package:abayati/features/screens/onboard/auth/sign_in.dart';
import 'package:abayati/features/screens/onboard/auth/sign_up.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/analytics.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/cart/checkout.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/home/details.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/home/store/store_details.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/measure/front_view_measure.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/measure/view_measurement.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/setting/setting.dart';
import 'package:abayati/features/screens/onboard/splash.dart';
import 'package:flutter/cupertino.dart';

import '../screens/onboard/dashboard/nav/cart/cart.dart';
import '../screens/onboard/dashboard/nav/home/store/store.dart';
import '../screens/onboard/dashboard/nav/measure/check_measurement.dart';
import '../screens/onboard/dashboard/nav/nav.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String forgotPassword = '/forgotPassword';
  static const String nav = '/nav';
  static const String details = '/details';
  static const String store = '/store';
  static const String storeDetails = '/storeDetails';
  static const String checkout = '/checkout';
  static const String cart = '/cart';
  static const String analytics = '/analytics';
  static const String settings = '/settings';
  static const String viewMeasurement = '/viewMeasurement';
  static const String checkMeasurement = '/checkMeasurement';
  static const String frontViewMeasure = '/frontViewMeasure';
  static const String sideViewMeasure = '/sideViewMeasure';
  static const String completeMeasure = '/completeMeasure';

  static var routes = <String, Widget Function(BuildContext)>{
    splash: (context) => const Splash(),
    signIn: (context) => const SignIn(),
    signUp: (context) => const SignUp(),
    forgotPassword: (context) => const ForgotPassword(),
    nav: (context) => const Nav(),
    details: (context) => const Details(),
    store: (context) => const StoreView(),
    storeDetails: (context) => const StoreDetails(),
    checkout: (context) => const Checkout(),
    cart: (context) => const CartView(),
    analytics: (context) => const AnalyticDashboard(),
    settings: (context) => const Setting(),
    viewMeasurement: (context) => const ViewMeasurement(),
    checkMeasurement: (context) => const CheckMeasurement(),
    frontViewMeasure: (context) => const FrontViewMeasure(),
    sideViewMeasure: (context) => const SideViewMeasure(),
    completeMeasure: (context) => const CompleteMeasurement(),
  };
}
