import 'dart:io';

import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:abayati/features/utils/components/app_snackbar.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/services/service/ai/bloc/ai_bloc.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/text_style.dart';
import '../../../../../utils/widgets/app_button.dart';
import 'measure.dart';

class FrontViewMeasure extends StatelessWidget {
  const FrontViewMeasure({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.settingsOf(context)?.arguments as Map;
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Take a front-view Picture',
                      textAlign: TextAlign.center,
                      style: Montserrat.kFontW5.copyWith(fontSize: 28.spMin)),
                  h(7),
                  Image.asset(Images.frontBody),
                  h(20),
                  Text(
                      '1. Stand straight with feet shoulder-width apart.\n\n2. Position the camera at eye level.\n\n3. Face the camera directly, no twisting.\n\n4. Ensure good lighting and a clear background.',
                      style:
                          Montserrat.kFontW5.copyWith(color: AppColor.k555555)),
                  const Spacer(),
                  AppButton(
                      onPressed: () async {
                        final image = await Helper.getImage();
                        if (image != null) {
                          Navigator.pushNamed(context, AppRoute.sideViewMeasure,
                              arguments: {
                                'height': args['height'],
                                'width': args['width'],
                                'front_image': File(image.path)
                              });
                        } else {
                          AppSnackbar.error(context,
                              message: 'No image selected');
                        }
                      },
                      text: 'Next')
                ],
              )).eHPad(6),
        ),
      ])),
    );
  }
}

class SideViewMeasure extends StatelessWidget {
  const SideViewMeasure({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.settingsOf(context)?.arguments as Map;

    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<AiBloc, AiState>(
        bloc: globals.aiBloc,
        listener: (context, state) {
          if (state is CreateMeasurementSuccess) {
            Navigator.pushNamed(context, AppRoute.completeMeasure);
          }
          if (state is CreateMeasurementError) {
            AppSnackbar.error(context, message: state.error);
          }
        },
        builder: (context, state) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: 100.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColor.kA89294),
                    child: Text('Measure',
                        style: Montserrat.kFontW5.copyWith(
                            fontSize: 48.spMin, color: AppColor.white))),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 17.h),
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(1.r),
                          border: Border.all(color: AppColor.kA89294)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Take a side-view Picture',
                              textAlign: TextAlign.center,
                              style: Montserrat.kFontW5
                                  .copyWith(fontSize: 28.spMin)),
                          h(7),
                          Image.asset(Images.sideBody),
                          h(20),
                          Text(
                              '1. Stand straight with feet shoulder-width apart.\n\n2. Position the camera at eye level.\n\n3. Face the camera directly, no twisting.\n\n4. Ensure good lighting and a clear background.',
                              style: Montserrat.kFontW5
                                  .copyWith(color: AppColor.k555555)),
                          const Spacer(),
                          AppButton(
                              onPressed: () async {
                                final image = await Helper.getImage();
                                if (image != null) {
                                  globals.aiBloc!.add(CreateMeasurementEvent(
                                      height: args['height'],
                                      width: args['width'],
                                      frontImage: args['front_image'],
                                      sideImage: File(image.path)));
                                } else {
                                  AppSnackbar.error(context,
                                      message: 'No image selected');
                                }
                              },
                              text: 'Next')
                        ],
                      )).eHPad(6),
                ),
              ]);
        },
      )),
    );
  }
}

class CompleteMeasurement extends StatelessWidget {
  const CompleteMeasurement({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 32.h, horizontal: 37.w),
                      decoration: const BoxDecoration(
                          color: AppColor.kA89294, shape: BoxShape.circle),
                      child: SvgPicture.asset(Vectors.measureCheck)),
                  h(49),
                  Text('Measurement Complete',
                      textAlign: TextAlign.center,
                      style: Montserrat.kFontW5.copyWith(fontSize: 32.spMin)),
                  const Spacer(),
                  MeasureButton(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.viewMeasurement);
                      },
                      text: 'View\nMeasurements'),
                  h(20)
                ],
              )).eHPad(6),
        ),
      ])),
    );
  }
}
