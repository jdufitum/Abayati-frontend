import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/text_style.dart';
import '../../../../../utils/widgets/app_button.dart';

class VirtualResult extends StatelessWidget {
  const VirtualResult({super.key});

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.settingsOf(context)?.arguments as String;
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Container(
            height: 100.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColor.kA89294),
            child: Text('Result',
                style: Montserrat.kFontW5
                    .copyWith(fontSize: 48.spMin, color: AppColor.white))),
        Flexible(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(1.r),
                  border: Border.all(color: AppColor.kA89294)),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(result),
                  h(20),
                  Text('This looks absolutely stunning on you.',
                      textAlign: TextAlign.center,
                      style: Montserrat.kFontW5.copyWith(fontSize: 17.spMin)),
                  h(7),
                  AppButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Continue Shopping')
                ],
              )).eHPad(6),
        ),
      ])),
    );
  }
}
