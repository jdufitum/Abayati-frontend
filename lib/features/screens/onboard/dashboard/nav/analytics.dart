import 'dart:math';

import 'package:abayati/features/utils/app_color.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:abayati/features/utils/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants.dart';

class AnalyticDashboard extends StatelessWidget {
  const AnalyticDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: showBackAppBar(context, title: 'Analytics Dashboard'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              h(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(30.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sales\nPerformance',
                        style: Roboto.kFontW6.copyWith(fontSize: 34.spMin)),
                    h(10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          7,
                          (index) => const AnalyticBar(),
                        )),
                    h(30),
                    Row(
                      children: [
                        Text('30%',
                            style: Montserrat.kFontW5
                                .copyWith(fontSize: 48.spMin)),
                        w(10),
                        Flexible(
                          child: Text(
                              'Your sales performance is 30% better compare to last month',
                              style: Montserrat.kFontW4
                                  .copyWith(fontSize: 20.spMin)),
                        )
                      ],
                    ),
                    h(20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: AppButton(onPressed: () {}, text: 'Details'),
                    )
                  ],
                ),
              ),
              h(24),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(30.r)),
                child: Text('Customer\nSegments',
                    style: Roboto.kFontW6.copyWith(fontSize: 34.spMin)),
              )
            ],
          ).hPad,
        ));
  }
}

class AnalyticBar extends StatelessWidget {
  const AnalyticBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Column(
      children: [
        Transform.rotate(
          angle: pi,
          child: Stack(
            children: [
              Container(
                width: 32.w,
                height: 207.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColor.kE9ECF1.withOpacity(.82)),
              ),
              Container(
                width: 32.w,
                height: 207.h - (random.nextInt(150)),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColor.k9C6644),
              ),
            ],
          ),
        ),
        Text(String.fromCharCode(random.nextInt(26) + 65),
            style: Montserrat.kFontW5.copyWith(
                fontSize: 28.spMin, color: AppColor.black.withOpacity(.5)))
      ],
    );
  }
}
