import 'package:abayati/features/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets/resources.dart';
import '../screens/onboard/dashboard/nav/home/home.dart';
import 'app_color.dart';
import 'app_route.dart';

SizedBox h(double height) {
  return SizedBox(height: height.h);
}

SizedBox w(double width) {
  return SizedBox(width: width.w);
}

PreferredSize showAppBar(BuildContext context, {bool isSettings = false}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 56.h),
    child: AppBar(
      backgroundColor: AppColor.primary,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          if (isSettings) {
            Navigator.pop(context);
          } else {
            Navigator.pushNamed(context, AppRoute.settings);
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          // padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 6.h),
          decoration: BoxDecoration(
              border: isSettings ? null : Border.all(color: AppColor.kA89294),
              color: AppColor.kF2F2F2,
              shape: BoxShape.circle),
          child: Icon(Icons.settings_outlined,
              color: isSettings ? AppColor.kEB3030 : AppColor.black),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: const Avatar(),
        ),
      ],
      title:
          Text('Lamsti', style: Lobster.kFontW4.copyWith(fontSize: 22.spMin)),
    ),
  );
}

PreferredSize showBackAppBar(BuildContext context,
    {required String title, bool showLeading = true}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 56.h),
    child: AppBar(
      backgroundColor: AppColor.primary,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      centerTitle: true,
      leading: showLeading
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new))
          : null,
      title:
          Text(title, style: Montserrat.kFontW6.copyWith(fontSize: 18.spMin)),
    ),
  );
}
