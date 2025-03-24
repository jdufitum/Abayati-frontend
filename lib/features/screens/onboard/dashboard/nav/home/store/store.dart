import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../assets/resources.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/app_route.dart';
import '../../../../../../utils/constants.dart';
import '../../../../../../utils/text_style.dart';
import '../home.dart';

class Store extends StatelessWidget {
  const Store({super.key});

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
              // h(21),
              const AppSearchField(),
              // h(28),
              // Row(
              //   children: [
              //     Text('All Featured',
              //         style: Montserrat.kFontW6.copyWith(fontSize: 18.spMin)),
              //     const Spacer(),
              //     Container(
              //       padding:
              //           EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
              //       decoration: BoxDecoration(
              //           color: AppColor.white,
              //           borderRadius: BorderRadius.circular(6.r)),
              //       child: Row(
              //         children: [
              //           Text('Sort',
              //               style: Montserrat.kFontW4
              //                   .copyWith(fontSize: 12.spMin)),
              //           w(4),
              //           SvgPicture.asset(Vectors.sort)
              //         ],
              //       ),
              //     ),
              //     w(12),
              //     Container(
              //       padding:
              //           EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
              //       decoration: BoxDecoration(
              //           color: AppColor.white,
              //           borderRadius: BorderRadius.circular(6.r)),
              //       child: Row(
              //         children: [
              //           Text('Filter',
              //               style: Montserrat.kFontW4
              //                   .copyWith(fontSize: 12.spMin)),
              //           w(4),
              //           SvgPicture.asset(Vectors.filt)
              //         ],
              //       ),
              //     ),
              //     w(11)
              //   ],
              // ),
              h(18),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    color: AppColor.kA89294,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text('Abaya’s',
                    style: LibreCasion.kFontW7
                        .copyWith(fontSize: 18.spMin, color: AppColor.kFCF4F4)),
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
                itemBuilder: (context, index) => const StoreCard(),
                itemCount: 6,
              ),
              h(20)
            ],
          ).hPad,
        ),
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.storeDetails);
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
                  Text('Store Name',
                      style: Montserrat.kFontW7.copyWith(fontSize: 15.spMin)),
                  h(3),
                  Text('Category: Abaya, Shayla,',
                      style: Montserrat.kFontW7.copyWith(fontSize: 8.spMin)),
                  h(4),
                  Text(
                      'Lorewmad w eai fejf iwe fewf ewf ewf ewf ewfew few fewfe wfewf ewfe wfewf refreferfr refrferf rferfref rfrfree rfrfe rferferf erferf erferf rferfer referf',
                      style: Montserrat.kFontW4.copyWith(fontSize: 8.spMin)),
                  h(10),
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
