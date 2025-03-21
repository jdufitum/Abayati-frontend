import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetPadding on Widget {
  Widget get hPad =>
      Padding(padding: EdgeInsets.symmetric(horizontal: 20.w), child: this);

  Widget eHPad(double width) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: width.w), child: this);

  Widget get vPad =>
      Padding(padding: EdgeInsets.symmetric(vertical: 20.h), child: this);

  Widget get allPad => Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: this);
}
