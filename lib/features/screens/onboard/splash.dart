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
    Future.delayed(const Duration(seconds: 5), () {
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
          ConstrainedBox(
            constraints: const BoxConstraints.expand(width: double.infinity),
            child: SvgPicture.asset(
              Vectors.splashBG,
              alignment: Alignment.topCenter,
              // fit: BoxFit.contain,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints.expand(width: double.infinity),
            child: SvgPicture.asset(
              Vectors.splashBgg,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 30.w, bottom: 30.h),
              child: Text('Lamsti',
                  textAlign: TextAlign.center,
                  style: Lobster.kFontW4.copyWith(fontSize: 64.spMin)),
            ),
          ).hPad
        ],
      ),
    );
  }
}
