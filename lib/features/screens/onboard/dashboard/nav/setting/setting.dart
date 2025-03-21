import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/text_style.dart';
import '../home/home.dart';

class Setting extends HookWidget {
  const Setting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var pushNoty = useState(false);
    var email = useState(false);

    return Scaffold(
      appBar: showAppBar(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // h(12),
            // const CustomAppBar().hPad,
            h(20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              color: AppColor.kF5F5F5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  h(35),
                  Row(
                    children: [
                      w(14),
                      const Avatar(),
                      w(12),
                      Text('Jennifer Stone',
                          style: Rubik.kFontW4.copyWith(fontSize: 18.spMin))
                    ],
                  ),
                  h(46),
                  Text('Account Settings',
                      style: Rubik.kFontW4.copyWith(
                          color: AppColor.kADADAD, fontSize: 18.spMin)),
                  h(32),
                  Text('Edit profile',
                      style: Rubik.kFontW4.copyWith(fontSize: 18.spMin)),
                  h(34),
                  Text('Change password',
                      style: Rubik.kFontW4.copyWith(fontSize: 18.spMin)),
                  h(34),
                  Text('Add a payment method',
                      style: Rubik.kFontW4.copyWith(fontSize: 18.spMin)),
                  h(34),
                  SwitchTile(
                      switchValue: pushNoty.value,
                      onChanged: (val) {
                        pushNoty.value = val;
                      },
                      text: 'Push notifications'),
                  h(23),
                  SwitchTile(
                      switchValue: email.value,
                      onChanged: (val) {
                        email.value = val;
                      },
                      text: 'Email News'),
                  h(46),
                  Text('More',
                      style: Rubik.kFontW4.copyWith(
                          color: AppColor.kADADAD, fontSize: 18.spMin)),
                  h(32),
                  Text('About us',
                      style: Rubik.kFontW4.copyWith(fontSize: 18.spMin)),
                  h(34),
                  Text('Privacy policy',
                      style: Rubik.kFontW4.copyWith(fontSize: 18.spMin)),
                  h(34),
                  Text('Terms and conditions',
                      style: Rubik.kFontW4.copyWith(fontSize: 18.spMin)),
                  h(20)
                ],
              ),
            ).eHPad(6)
          ],
        ),
      )),
    );
  }
}

class SwitchTile extends StatelessWidget {
  const SwitchTile(
      {super.key,
      required this.switchValue,
      required this.text,
      required this.onChanged});

  final bool switchValue;
  final void Function(bool) onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Rubik.kFontW4.copyWith(fontSize: 18.spMin)),
        AppSwitch(
          value: switchValue,
          onChanged: onChanged,
        )
      ],
    );
  }
}

class AppSwitch extends StatelessWidget {
  const AppSwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: value,
        activeColor: AppColor.white,
        activeTrackColor: AppColor.k9C6644,
        inactiveThumbColor: AppColor.white,
        inactiveTrackColor: AppColor.kEAEAEA,
        trackOutlineColor: const WidgetStatePropertyAll(AppColor.kEAEAEA),
        onChanged: onChanged);
  }
}
