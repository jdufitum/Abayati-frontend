import 'package:abayati/features/screens/onboard/auth/forgot_password.dart';
import 'package:abayati/features/screens/onboard/auth/sign_in.dart';
import 'package:abayati/features/screens/onboard/auth/sign_up.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/analytics.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/cart/checkout.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/home/details.dart';
import 'package:abayati/features/screens/onboard/splash.dart';
import 'package:flutter/cupertino.dart';

import '../screens/onboard/dashboard/nav/cart/cart.dart';
import '../screens/onboard/dashboard/nav/nav.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String forgotPassword = '/forgotPassword';
  static const String nav = '/nav';
  static const String details = '/details';
  static const String checkout = '/checkout';
  static const String cart = '/cart';
  static const String analytics = '/analytics';

  static var routes = <String, Widget Function(BuildContext)>{
    splash: (context) => const Splash(),
    signIn: (context) => const SignIn(),
    signUp: (context) => const SignUp(),
    forgotPassword: (context) => const ForgotPassword(),
    nav: (context) => const Nav(),
    details: (context) => const Details(),
    checkout: (context) => const Checkout(),
    cart: (context) => const Cart(),
    analytics: (context) => const AnalyticDashboard(),
  };
}
