import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/utils/app_color.dart';
import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/constants.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:abayati/features/utils/widgets/app_button.dart';
import 'package:abayati/features/utils/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            h(19),
            Text('Welcome\nBack!',
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
            h(9),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.forgotPassword);
              },
              child: Text('Forgot Passsword?',
                  textAlign: TextAlign.end,
                  style: Montserrat.kFontW4
                      .copyWith(fontSize: 12.spMin, color: AppColor.k9C6644)),
            ),
            h(52),
            AppButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.nav);
                },
                text: 'Login'),
            h(75),
            Text.rich(
                TextSpan(
                    text: 'Create An Account ',
                    style: Montserrat.kFontW4.copyWith(color: AppColor.k575757),
                    children: [
                      TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, AppRoute.signUp);
                            },
                          style: Montserrat.kFontW6.copyWith(
                              color: AppColor.k9C6644,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.k9C6644,
                              decorationStyle: TextDecorationStyle.solid))
                    ]),
                textAlign: TextAlign.center),
            h(28),
            Text(
              '- OR Continue with -',
              textAlign: TextAlign.center,
              style: Montserrat.kFontW5
                  .copyWith(fontSize: 12.spMin, color: AppColor.k575757),
            ),
            h(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SignUpOption(vector: Vectors.google),
                w(10),
                const SignUpOption(vector: Vectors.apple),
                w(10),
                const SignUpOption(vector: Vectors.facebook),
              ],
            ),
            h(20)
          ],
        ).hPad,
      )),
    );
  }
}

class SignUpOption extends StatelessWidget {
  const SignUpOption({
    super.key,
    required this.vector,
  });

  final String vector;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.k9C6644),
          color: AppColor.white),
      child: SvgPicture.asset(vector),
    );
  }
}
