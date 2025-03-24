import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xffFCF4F4);
  static const Color k676767 = Color(0xff676767);
  static const Color k9C6644 = Color(0xff9C6644);
  static const Color kA89294 = Color(0xffA89294);
  static const Color kC93636 = Color(0xffC93636);
  static const Color kA8A8A9 = Color(0xffA8A8A9);
  static const Color kADADAD = Color(0xffADADAD);
  static const Color kF3F3F3 = Color(0xffF3F3F3);
  static const Color kF5F5F5 = Color(0xffF5F5F5);
  static const Color k555555 = Color(0xff555555);
  static const Color kF5F3F3 = Color(0xffF5F3F3);
  static const Color kF2F2F2 = Color(0xffF2F2F2);
  static const Color kF4F4F4 = Color(0xffF4F4F4);
  static const Color kFCF4F4 = Color(0xffFCF4F4);
  static const Color kF8F8F8 = Color(0xffF8F8F8);
  static const Color k575757 = Color(0xff575757);
  static const Color kFF4B26 = Color(0xffFF4B26);
  static const Color kEB3030 = Color(0xffEB3030);
  static const Color k888888 = Color(0xff888888);
  static const Color kBBBBBB = Color(0xffBBBBBB);
  static const Color kBCBCBC = Color(0xffBCBCBC);
  static const Color kE83636 = Color(0xffE83636);
  static const Color kEAEAEA = Color(0xffEAEAEA);
  static const Color k21003D = Color(0xff21003D);
  static const Color kB08968 = Color(0xffB08968);
  static const Color kEDB310 = Color(0xffEDB310);
  static const Color kD9D9D9 = Color(0xffD9D9D9);
  static const Color k9E9D9D = Color(0xff9E9D9D);
  static const Color kD8D6D6 = Color(0xffD8D6D6);
  static const Color kD4A384 = Color(0xffD4A384);
  static const Color k912C25 = Color(0xff912C25);
  static const Color k1A4E7D = Color(0xff1A4E7D);
  static const Color k313F59 = Color(0xff313F59);
  static const Color k9C3EAF = Color(0xff9C3EAF);
  static const Color k4C5059 = Color(0xff4C5059);
  static const Color k6E7179 = Color(0xff6E7179);
  static const Color kE9ECF1 = Color(0xffE9ECF1);
  static const Color kD2BFC1 = Color(0xffD2BFC1);
  static const Color k656565 = Color(0xff656565);

  static const Color black = Colors.black;
  static const Color white = Colors.white;
}

Map<int, Color> kPrimaryMap = {
  50: const Color.fromRGBO(237, 224, 212, .1),
  100: const Color.fromRGBO(237, 224, 212, .2),
  200: const Color.fromRGBO(237, 224, 212, .3),
  300: const Color.fromRGBO(237, 224, 212, .4),
  400: const Color.fromRGBO(237, 224, 212, .5),
  500: const Color.fromRGBO(237, 224, 212, .6),
  600: const Color.fromRGBO(237, 224, 212, .7),
  700: const Color.fromRGBO(237, 224, 212, .8),
  800: const Color.fromRGBO(237, 224, 212, .9),
  900: const Color.fromRGBO(237, 224, 212, 1),
};

MaterialColor kMaterialColor =
    MaterialColor(AppColor.primary.value, kPrimaryMap);
