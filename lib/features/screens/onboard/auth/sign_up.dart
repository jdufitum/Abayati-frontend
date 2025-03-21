import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/resources.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constants.dart';
import '../../../utils/text_style.dart';
import '../../../utils/widgets/app_button.dart';
import '../../../utils/widgets/text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
            h(19),
            Text('Create an\naccount',
                style: Montserrat.kFontW7.copyWith(fontSize: 36.spMin)),
            h(36),
            AppTextField(
              controller: TextEditingController(),
              hintText: 'Username or Email',
              prefixIcon: SvgPicture.asset(Vectors.user, fit: BoxFit.scaleDown),
            ),
            h(31),
            AppTextField(
              controller: TextEditingController(),
              hintText: 'Password',
              isPassword: true,
              prefixIcon: SvgPicture.asset(Vectors.lock, fit: BoxFit.scaleDown),
            ),
            h(31),
            AppTextField(
              controller: TextEditingController(),
              hintText: 'Confirm Password',
              isPassword: true,
              prefixIcon: SvgPicture.asset(Vectors.lock, fit: BoxFit.scaleDown),
            ),
            h(31),
            AppButton(onPressed: () {}, text: 'Create Account'),
            h(8),
            Text.rich(
                TextSpan(
                    text: 'I Already Have an Account ',
                    style: Montserrat.kFontW4.copyWith(color: AppColor.k575757),
                    children: [
                      TextSpan(
                          text: 'Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, AppRoute.signIn);
                            },
                          style: Montserrat.kFontW6.copyWith(
                              color: AppColor.k9C6644,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.k9C6644,
                              decorationStyle: TextDecorationStyle.solid))
                    ]),
                textAlign: TextAlign.center),
                    ],
                  ).hPad,
          )),
    );
  }
}
