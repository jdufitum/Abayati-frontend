import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/utils/app_color.dart';
import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/constants.dart';

class AiMeasure extends StatelessWidget {
  const AiMeasure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(1.r),
                      border: Border.all(color: AppColor.kA89294)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Vectors.traingleRuler),
                      h(60),
                      MeasureButton(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoute.checkMeasurement);
                          },
                          text: 'Check\nMeasurement'),
                      h(19),
                      MeasureButton(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoute.viewMeasurement);
                          },
                          text: 'View\nMeasurements')
                    ],
                  )),
            ),
            h(10)
          ],
        ).eHPad(6),
      ),
    );
  }
}

class MeasureButton extends StatelessWidget {
  const MeasureButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 41.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.kA89294, borderRadius: BorderRadius.circular(5.r)),
        height: 80.h,
        child: Text(text,
            textAlign: TextAlign.center,
            style: Montserrat.kFontW6
                .copyWith(color: AppColor.white, fontSize: 24.spMin)),
      ),
    );
  }
}
