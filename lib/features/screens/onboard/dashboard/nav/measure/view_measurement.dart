import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/constants.dart';

class ViewMeasurement extends StatelessWidget {
  const ViewMeasurement({super.key});

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
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(1.r),
                      border: Border.all(color: AppColor.kA89294)),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jennifer’s Measurements',
                          style:
                              Montserrat.kFontW7.copyWith(fontSize: 18.spMin)),
                      h(7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Measurement',
                              style: Montserrat.kFontW7.copyWith(
                                  fontSize: 16.spMin, color: AppColor.k656565)),
                          Text('Inch',
                              style: Montserrat.kFontW7.copyWith(
                                  fontSize: 16.spMin, color: AppColor.k656565)),
                        ],
                      ),
                      h(7),
                      ...measurements.entries.toList().map(
                            (e) => Padding(
                              padding: EdgeInsets.only(bottom: 12.0.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(e.key,
                                      style: Montserrat.kFontW4
                                          .copyWith(fontSize: 16.spMin)),
                                  Text(e.value,
                                      style: Montserrat.kFontW4
                                          .copyWith(fontSize: 16.spMin)),
                                ],
                              ),
                            ),
                          )
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

Map<String, String> measurements = {
  'Neck': '15',
  'Shoulder Width': '34',
  'Chest': '12',
  'Waist': '34',
  'Hips': '9',
  'Bust': '12',
  'Arm Length': '21',
  'Bicep': '13',
  'Wrist': '43',
  'Back Length': '10',
  'Front Length': '23',
  'Rise': '18',
  'Inseam': '92',
  'Outseam': '54',
  'Thigh': '22',
};
