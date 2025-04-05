import 'package:abayati/features/core/model/response/measurement.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_route.dart';
import '../../../../../utils/constants.dart';
import 'measure.dart';

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${globals.user!.username}’s Measurements',
                          style:
                              Montserrat.kFontW7.copyWith(fontSize: 18.spMin)),
                      h(7),
                      if (globals.measurement?.id != null)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Measurement',
                                    style: Montserrat.kFontW7.copyWith(
                                        fontSize: 16.spMin,
                                        color: AppColor.k656565)),
                                Text('Inch',
                                    style: Montserrat.kFontW7.copyWith(
                                        fontSize: 16.spMin,
                                        color: AppColor.k656565)),
                              ],
                            ),
                            h(7),
                            ...measurements(globals.measurement)
                                .entries
                                .toList()
                                .map(
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
                        )
                      else
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('You currently have no saved measurement',
                                  style: Montserrat.kFontW5),
                              h(30),
                              MeasureButton(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AppRoute.checkMeasurement);
                                  },
                                  text: 'Check\nMeasurement'),
                            ],
                          ),
                        ),
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

Map<String, String> measurements(Measurement? measurement) => {
      'Neck': measurement!.volumeParams!.neck.toString(),
      'Shoulder Width': measurement.frontParams!.backShoulderWidth.toString(),
      'Chest': measurement.volumeParams!.chest.toString(),
      'Waist': measurement.volumeParams!.waist.toString(),
      'Hips': measurement.volumeParams!.highHips.toString(),
      'Bust': measurement.frontParams!.bustHeight.toString(),
      'Arm Length': measurement.volumeParams!.forearm.toString(),
      'Bicep': measurement.volumeParams!.bicep.toString(),
      'Wrist': measurement.volumeParams!.wrist.toString(),
      'Back Length': measurement.frontParams!.backNeckToHipLength.toString(),
      'Front Length': measurement.frontParams!.frontCrotchLength.toString(),
      'Rise': measurement.frontParams!.rise.toString(),
      'Inseam': measurement.frontParams!.inseam.toString(),
      'Outseam': measurement.frontParams!.outseam.toString(),
      'Thigh': measurement.volumeParams!.thigh.toString(),
    };
