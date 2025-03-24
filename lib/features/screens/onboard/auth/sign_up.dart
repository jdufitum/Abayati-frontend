import 'package:abayati/features/core/model/request/auth.dart';
import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:abayati/features/utils/components/app_snackbar.dart';
import 'package:abayati/features/utils/components/loader.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/resources.dart';
import '../../../core/services/service/auth/bloc/auth_bloc.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constants.dart';
import '../../../utils/text_style.dart';
import '../../../utils/widgets/app_button.dart';
import '../../../utils/widgets/text_field.dart';

class SignUp extends HookWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameCtrl = useTextEditingController();
    final emailCtrl = useTextEditingController();
    final passwordCtrl = useTextEditingController();
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
            if (state is RegisterSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.signIn, (route) => false);
            }
            if (state is RegisterError) {
              AppSnackbar.error(context, message: state.error);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                h(19),
                Text('Create an\naccount',
                    style: Montserrat.kFontW7.copyWith(fontSize: 36.spMin)),
                h(36),
                AppTextField(
                  controller: usernameCtrl,
                  hintText: 'Username',
                  prefixIcon:
                      SvgPicture.asset(Vectors.user, fit: BoxFit.scaleDown),
                ),
                h(31),
                AppTextField(
                  controller: emailCtrl,
                  hintText: 'Email',
                  prefixIcon:
                      SvgPicture.asset(Vectors.user, fit: BoxFit.scaleDown),
                ),
                h(31),
                AppTextField(
                  controller: passwordCtrl,
                  hintText: 'Password',
                  isPassword: true,
                  prefixIcon:
                      SvgPicture.asset(Vectors.lock, fit: BoxFit.scaleDown),
                ),
                h(31),
                AppTextField(
                  controller: passwordCtrl,
                  hintText: 'Confirm Password',
                  isPassword: true,
                  prefixIcon:
                      SvgPicture.asset(Vectors.lock, fit: BoxFit.scaleDown),
                ),
                h(31),
                AppButton(
                    onPressed: () {
                      globals.authBloc!.add(RegisterEvent(
                          registerDto: RegisterDto(
                              username: usernameCtrl.text,
                              email: emailCtrl.text,
                              password: passwordCtrl.text)));
                    },
                    text: 'Create Account'),
                h(8),
                Text.rich(
                    TextSpan(
                        text: 'I Already Have an Account ',
                        style: Montserrat.kFontW4
                            .copyWith(color: AppColor.k575757),
                        children: [
                          TextSpan(
                              text: 'Login',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, AppRoute.signIn);
                                },
                              style: Montserrat.kFontW6.copyWith(
                                  color: AppColor.kA89294,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColor.k9C6644,
                                  decorationStyle: TextDecorationStyle.solid))
                        ]),
                    textAlign: TextAlign.center),
              ],
            );
          },
        ).hPad,
      )),
    );
  }
}
