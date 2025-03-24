import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/text_style.dart';
import '../home/home.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // h(12),
            // const CustomAppBar(),
            // h(22),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: AppColor.kA89294)),
              child: Text('My Wishlist',
                  style: LibreCasion.kFontW7.copyWith(fontSize: 24.spMin)),
            ),
            h(30),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 260.h,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 15.w),
              itemBuilder: (context, index) => const ItemCard(),
              itemCount: 6,
            ),
            h(20)
          ],
        ).hPad,
      )),
    );
  }
}
