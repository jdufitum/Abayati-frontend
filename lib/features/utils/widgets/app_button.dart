import 'package:abayati/features/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.width = double.infinity,
      this.textColor = AppColor.white,
      this.buttonColor = AppColor.kA89294,
      this.fontWeight = FontWeight.w500,
      this.fontSize = 20,
      this.fontStyle,
      this.height = 55,
      this.side = BorderSide.none,
      this.enabled = true,
      this.child});

  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final Color buttonColor;
  final Widget? child;
  final FontWeight fontWeight;
  final double fontSize;
  final double height;
  final double? width;
  final BorderSide side;
  final bool? enabled;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width?.w,
      child: ElevatedButton(
          onPressed: enabled! ? onPressed : null,
          style: ElevatedButton.styleFrom(
              backgroundColor: enabled! ? buttonColor : AppColor.k888888,
              elevation: 0,
              splashFactory: NoSplash.splashFactory,
              shape: RoundedRectangleBorder(
                  side: side, borderRadius: BorderRadius.circular(8.r))),
          child: Text(text,
              textAlign: TextAlign.center,
              style: Montserrat.kFontW6.copyWith(
                  color: textColor ?? AppColor.white,
                  fontStyle: fontStyle,
                  fontSize: fontSize.spMin))),
    );
  }
}
