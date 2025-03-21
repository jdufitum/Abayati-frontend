import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_route.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 8), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoute.signIn);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 40,
              child: SvgPicture.asset(
                Vectors.splashB1,
                height: 400.h,
              )),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(Vectors.splashB2),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(
              Vectors.splashB3,
              height: 300.h,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(Vectors.splashB4),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Text('Abayati',
                  textAlign: TextAlign.center,
                  style: LibreCasion.kFontW7.copyWith(fontSize: 64.spMin)),
            ),
          ).hPad
        ],
      ),
    );
  }
}
