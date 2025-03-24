import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constants.dart';
import '../../../../../../utils/text_style.dart';
import '../home.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              h(18),
              Container(
                height: 220.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Images.storeBg),
                        fit: BoxFit.fitWidth)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  color: AppColor.kA89294,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Abaya store 123',
                        style: LibreCasion.kFontW7.copyWith(
                            fontSize: 20.spMin, color: AppColor.white)),
                    Text('Category: Abaya, Shayla,',
                        style: LibreCasion.kFontW7.copyWith(
                            fontSize: 12.spMin, color: AppColor.kFCF4F4)),
                    Text(
                        'efefefewf  efefefewf efefefewf  efefefewf  efefefewf  efefefewf efefefewf efefefewf vefefefewf efefefewf efefefewf efefefewf efefefewf efefefewf efefefewf efefefewf efefefewf efefefewf',
                        style: LibreCasion.kFontW4.copyWith(
                            fontSize: 8.spMin, color: AppColor.kFCF4F4)),
                  ],
                ),
              ),
              h(15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 240.h,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 15.w),
                itemBuilder: (context, index) => const StoreDetailCard(),
                itemCount: 6,
              ).eHPad(9),
              h(20)
            ],
          ),
        ),
      ),
    );
  }
}

class StoreDetailCard extends StatelessWidget {
  const StoreDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, AppRoute.details);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(color: AppColor.kA89294),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 121.h,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(4.r)),
                  image: const DecorationImage(
                      image: AssetImage(Images.abaya100), fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('XXX Coloured Abaya’s',
                      style: Montserrat.kFontW5.copyWith(fontSize: 12.spMin)),
                  h(3),
                  Text('Plain Black Colour Abaya \nAbaya 123',
                      style: Montserrat.kFontW4.copyWith(fontSize: 10.spMin)),
                  h(4),
                  Text('800 QR',
                      style: Montserrat.kFontW5.copyWith(fontSize: 12.spMin)),
                  SizedBox(
                    width: 43.w,
                    child: Divider(
                      color: AppColor.kBBBBBB,
                      thickness: .5.w,
                    ),
                  ),
                  h(4),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: AppColor.kEDB310,
                    ),
                    onRatingUpdate: (rating) {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
