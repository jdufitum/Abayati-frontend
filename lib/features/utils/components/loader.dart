import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../app_color.dart';

class AppLoader {
  static Future<void> show(BuildContext context, {String? message}) async {
    final focus = FocusScope.of(context);
    if (focus.hasFocus) {
      focus.unfocus();
    }

    // if (OverlayManager.overlayEntry != null) {
    //   OverlayManager.hideSnackBar();
    // }

    // final actualMessage = message ?? await _resolveMessage();

    Loader.show(
      context,
      overlayColor: const Color.fromRGBO(17, 17, 17, 0.3),
      progressIndicator: Material(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingAnimationWidget.fallingDot(
                  color: AppColor.kA89294, size: 24.sp),
            ],
          ),
        ),
      ),
    );
  }

  static void hide() {
    Loader.hide();
  }

// static Future<String> _resolveMessage() async {
//   await Future.delayed(const Duration(milliseconds: 1));
//   return 'Loading';
// }
}
