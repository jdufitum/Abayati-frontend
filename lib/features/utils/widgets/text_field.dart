import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/utils/app_color.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class AppTextField extends HookWidget {
  const AppTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.inputType,
      this.inputAction,
      this.maxLength,
      this.maxLine = 1,
      this.suffixIcon,
      this.suffix,
      this.prefixIcon,
      this.enabled,
      this.inputFormatters,
      this.validator,
      this.onChanged,
      this.onTap,
      this.fillColor,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.labelTrailing,
      this.hasSymbol = true,
      this.readOnly = false,
      this.obscure = false,
      this.isPassword = false});

  final TextSpan? labelTrailing;
  final Color? fillColor;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final int? maxLength;
  final int? maxLine;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final bool? enabled;
  final bool hasSymbol;
  final bool readOnly;
  final bool obscure;
  final bool isPassword;
  final List<TextInputFormatter>? inputFormatters;

  // final DropDownSheetDetails? sheetDetails;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    var visible = useState(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          obscureText: isPassword ? visible.value : false,
          obscuringCharacter: 'X',
          readOnly: readOnly,
          maxLength: maxLength,
          maxLines: maxLine,
          enabled: enabled,
          style: Montserrat.kFontW5,
          inputFormatters: inputFormatters,
          cursorHeight: 16,
          cursorColor: AppColor.k9C6644,
          textInputAction: inputAction,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? AppColor.kF3F3F3,
            isDense: true,
            counterText: '',
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
            hintText: hintText,
            errorStyle: Montserrat.kFontW3
                .copyWith(fontSize: 12.spMin, color: AppColor.kC93636),
            hintStyle: Montserrat.kFontW5
                .copyWith(fontSize: 12.spMin, color: AppColor.k676767),
            suffix: suffix,
            suffixIcon: isPassword
                ? GestureDetector(
                    onTap: () => visible.value = !visible.value,
                    child: SvgPicture.asset(
                        visible.value ? Vectors.eye : Vectors.eye,
                        fit: BoxFit.scaleDown))
                : suffixIcon,
            // ??
            // (readOnly
            //     ? SvgPicture.asset(getAssetPath('arrow-down.svg'),
            //     fit: BoxFit.scaleDown)
            //     : null),
            // prefixIcon: sheetDetails != null
            //     ? SvgPicture.asset(getAssetPath(sheetDetails!.asset),
            //     fit: BoxFit.scaleDown)
            //     : prefixIcon,
            prefixIcon: prefixIcon,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppColor.kA8A8A9)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppColor.kA8A8A9)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppColor.kA8A8A9)),

            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8.r),
            //   borderSide: const BorderSide(color: AppColor.kError),
            // ),
          ),
        )
      ],
    );
  }
}
