import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/home/details.dart';
import 'package:abayati/features/utils/app_color.dart';
import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:abayati/features/utils/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/constants.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final showLeading =
        (ModalRoute.settingsOf(context)?.arguments ?? false) as bool;
    return Scaffold(
      appBar: showBackAppBar(context, showLeading: showLeading, title: 'Cart'),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          h(30),
          Row(
            children: [
              SvgPicture.asset(Vectors.location),
              w(8),
              Text('Delivery Address', style: Montserrat.kFontW6.copyWith())
            ],
          ),
          h(10),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Address :',
                                style: Montserrat.kFontW5
                                    .copyWith(fontSize: 12.spMin)),
                            h(4),
                            Text('Qatar foundation, Green Spine',
                                style: Montserrat.kFontW5
                                    .copyWith(fontSize: 12.spMin)),
                            h(10)
                          ],
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: SvgPicture.asset(Vectors.edit))
                      ],
                    ),
                  ),
                ),
                w(12),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 27.w, vertical: 27.h),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: SvgPicture.asset(Vectors.add),
                )
              ],
            ),
          ),
          h(11),
          Text('Shopping List', style: Montserrat.kFontW6),
          h(10),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                const ShoppingTile(),
                h(11),
                const ShoppingTile(),
                h(11),
                const ShoppingTile(),
              ],
            ),
          ),
          h(30),
          AppButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.checkout);
              },
              text: 'Pay')
        ],
      ).hPad),
    );
  }
}

class ShoppingTile extends StatelessWidget {
  const ShoppingTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r), color: AppColor.white),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 125.h,
                width: 131.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: const DecorationImage(
                        image: AssetImage(Images.abaya105))),
              ),
              w(9),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Blue moon abaya', style: Montserrat.kFontW6.copyWith()),
                  h(5),
                  Row(
                    children: [
                      Text('Variations : ',
                          style:
                              Montserrat.kFontW5.copyWith(fontSize: 12.spMin)),
                      w(8),
                      const Variation(),
                      w(5),
                      const Variation()
                    ],
                  ),
                  h(7),
                  Row(
                    children: [
                      Text('4.8',
                          style:
                              Montserrat.kFontW5.copyWith(fontSize: 12.spMin)),
                      w(5),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 18,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: AppColor.kEDB310,
                        ),
                        onRatingUpdate: (rating) {},
                      )
                    ],
                  ),
                  h(7),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(color: AppColor.black, width: .3)),
                    child: Text('800 QR',
                        style: Montserrat.kFontW6.copyWith(fontSize: 16.spMin)),
                  )
                ],
              )
            ],
          ),
          h(12),
          const HDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Order (1)   :',
                  style: Montserrat.kFontW5.copyWith(fontSize: 12.spMin)),
              Text('800 QR',
                  style: Montserrat.kFontW6.copyWith(fontSize: 12.spMin))
            ],
          )
        ],
      ),
    );
  }
}

class Variation extends StatelessWidget {
  const Variation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColor.black, width: .3)),
      child:
          Text('Black', style: Montserrat.kFontW5.copyWith(fontSize: 10.spMin)),
    );
  }
}
