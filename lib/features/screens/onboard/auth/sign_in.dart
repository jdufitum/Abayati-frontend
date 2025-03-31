import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/core/model/request/auth.dart';
import 'package:abayati/features/utils/app_color.dart';
import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:abayati/features/utils/components/app_snackbar.dart';
import 'package:abayati/features/utils/components/loader.dart';
import 'package:abayati/features/utils/constants.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:abayati/features/utils/validator.dart';
import 'package:abayati/features/utils/widgets/app_button.dart';
import 'package:abayati/features/utils/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/services/service/auth/bloc/auth_bloc.dart';

class SignIn extends HookWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final emailCtrl = useTextEditingController(text: 'password');
    final passwordCtrl = useTextEditingController(text: 'Password123!');
    final key = useState(GlobalKey<FormState>());

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: globals.authBloc,
          listener: (context, state) {
            if (state is AuthLoading) {
              AppLoader.show(context);
            } else {
              AppLoader.hide();
            }
            if (state is LoginSuccess) {
              Navigator.pushNamed(context, AppRoute.nav);
            }
            if (state is LoginError) {
              AppSnackbar.error(context, message: state.error);
            }
          },
          builder: (context, state) {
            return Form(
              key: key.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  h(19),
                  Text('Welcome\nBack!',
                      style: Montserrat.kFontW7.copyWith(fontSize: 36.spMin)),
                  h(36),
                  AppTextField(
                    controller: emailCtrl,
                    hintText: 'Username or Email',
                    prefixIcon:
                        SvgPicture.asset(Vectors.user, fit: BoxFit.scaleDown),
                    validator: (val) =>
                        Validator.validateText(val!, text: 'Enter email'),
                  ),
                  h(31),
                  AppTextField(
                    controller: passwordCtrl,
                    hintText: 'Password',
                    isPassword: true,
                    prefixIcon:
                        SvgPicture.asset(Vectors.lock, fit: BoxFit.scaleDown),
                    validator: (val) =>
                        Validator.validateText(val!, text: 'Enter password'),
                  ),
                  h(9),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.forgotPassword);
                    },
                    child: Text('Forgot Passsword?',
                        textAlign: TextAlign.end,
                        style: Montserrat.kFontW4.copyWith(
                            fontSize: 12.spMin, color: AppColor.kA89294)),
                  ),
                  h(52),
                  AppButton(
                      onPressed: () {
                        if (key.value.currentState!.validate()) {
                          globals.authBloc!.add(LoginEvent(
                              loginDto: LoginDto(
                                  email: emailCtrl.text,
                                  password: passwordCtrl.text)));
                        }
                      },
                      text: 'Login'),
                  h(75),
                  Text.rich(
                      TextSpan(
                          text: 'Create An Account ',
                          style: Montserrat.kFontW4
                              .copyWith(color: AppColor.k575757),
                          children: [
                            TextSpan(
                                text: 'Sign Up',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, AppRoute.signUp);
                                  },
                                style: Montserrat.kFontW6.copyWith(
                                    color: AppColor.kA89294,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColor.kA89294,
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
              ),
            );
          },
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
          border: Border.all(color: AppColor.kA89294),
          color: AppColor.white),
      child: SvgPicture.asset(vector),
    );
  }
}
