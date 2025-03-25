import 'package:abayati/features/utils/constants.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/resources.dart';
import '../../../utils/app_color.dart';
import '../../../utils/text_style.dart';
import '../../../utils/widgets/app_button.dart';
import '../../../utils/widgets/text_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            h(19),
            Text('Forgot\npassword?',
                style: Montserrat.kFontW7.copyWith(fontSize: 36.spMin)),
            h(36),
            AppTextField(
              controller: TextEditingController(),
              hintText: 'Enter your email address',
              prefixIcon: SvgPicture.asset(Vectors.mail, fit: BoxFit.scaleDown),
            ),
            h(26),
            Text.rich(TextSpan(
                text: '* ',
                style: Montserrat.kFontW4
                    .copyWith(color: AppColor.kFF4B26, fontSize: 12.spMin),
                children: [
                  TextSpan(
                      text:
                          'We will send you a message to set or reset your new password',
                      style: Montserrat.kFontW4.copyWith(
                          color: AppColor.k676767, fontSize: 12.spMin))
                ])),
            h(26),
            AppButton(onPressed: () {}, text: 'Submit'),
            h(46),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 52.h,
                width: 52.w,
                decoration: const BoxDecoration(
                    color: AppColor.kA89294, shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_back,
                  size: 36.dm,
                  color: AppColor.white,
                ),
              ),
            )
          ],
        ).hPad,
      )),
    );
  }
}
