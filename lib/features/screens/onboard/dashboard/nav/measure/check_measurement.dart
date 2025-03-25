import 'package:abayati/features/utils/app_color.dart';
import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/widgets/app_button.dart';

class CheckMeasurement extends StatelessWidget {
  const CheckMeasurement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
            height: 100.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColor.kA89294),
            child: Text('Measure',
                style: Montserrat.kFontW5
                    .copyWith(fontSize: 48.spMin, color: AppColor.white))),
        Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(1.r),
                  border: Border.all(color: AppColor.kA89294)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Input body measurements',
                      textAlign: TextAlign.center,
                      style: Montserrat.kFontW5.copyWith(fontSize: 32.spMin)),
                  h(50),
                  MeasureField(
                      controller: TextEditingController(),
                      label: 'Enter your height (cm)'),
                  h(16),
                  MeasureField(
                      controller: TextEditingController(),
                      label: 'Enter your weight (kg)'),
                  h(7),
                  const Spacer(),
                  AppButton(onPressed: () {
                    Navigator.pushNamed(context, AppRoute.frontViewMeasure);
                  }, text: 'Next')
                ],
              )).eHPad(6),
        ),
      ])),
    );
  }
}

class MeasureField extends StatelessWidget {
  const MeasureField({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Montserrat.kFontW5),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          cursorColor: AppColor.kA89294,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.kD9D9D9,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              border: InputBorder.none),
        ),
      ],
    );
  }
}
