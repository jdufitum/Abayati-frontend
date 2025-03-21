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

PreferredSize showAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 56.h),
    child: AppBar(
      backgroundColor: AppColor.primary,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoute.analytics);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          // padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 6.h),
          decoration: const BoxDecoration(
              color: AppColor.kF2F2F2, shape: BoxShape.circle),
          child: SvgPicture.asset(Vectors.filter, fit: BoxFit.scaleDown),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: const Avatar(),
        ),
      ],
      title: Text('Abayati',
          style: LibreCasion.kFontW7.copyWith(fontSize: 18.spMin)),
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
