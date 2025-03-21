import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/home/details.dart';
import 'package:abayati/features/utils/app_color.dart';
import 'package:abayati/features/utils/constants.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:abayati/features/utils/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showBackAppBar(context, title: 'Checkout'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          h(30),
          const PriceTile(
            title: 'Order',
            price: '1600 QR',
          ),
          h(18),
          const PriceTile(
            title: 'Shipping',
            price: '50 QR',
          ),
          h(18),
          const PriceTile(
            title: 'Total',
            price: '1650 QR',
          ),
          const HDivider(),
          h(28),
          Text('Payment',
              style: Montserrat.kFontW5.copyWith(fontSize: 18.spMin)),
          h(10),
          const PaymentTile(provider: Images.visa),
          const PaymentTile(provider: Images.maestro),
          const PaymentTile(provider: Images.signInApple),
          h(37),
          AppButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => Align(
                          alignment: Alignment.center,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              margin: EdgeInsets.symmetric(horizontal: 22.w),
                              padding: EdgeInsets.symmetric(vertical: 30.h),
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(6.r)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(Vectors.successCheck),
                                  h(26),
                                  Text('Payment was successful',
                                      style: Montserrat.kFontW5
                                          .copyWith(fontSize: 18.spMin))
                                ],
                              ),
                            ),
                          ),
                        ));
              },
              text: 'Continue')
        ],
      ).eHPad(40),
    );
  }
}

class PaymentTile extends StatelessWidget {
  const PaymentTile({
    super.key,
    required this.provider,
  });

  final String provider;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 25.h),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColor.kF4F4F4,
            border: Border.all(color: AppColor.kF8F8F8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(provider),
            Text('*********2109',
                style: Montserrat.kFontW5
                    .copyWith(fontSize: 15.spMin, color: AppColor.k6E7179))
          ],
        ));
  }
}

class PriceTile extends StatelessWidget {
  const PriceTile({
    super.key,
    required this.title,
    required this.price,
  });

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Montserrat.kFontW5.copyWith(
                fontSize: 18.spMin,
                color: title == 'Total' ? AppColor.k4C5059 : AppColor.kA8A8A9)),
        Text(price, style: Montserrat.kFontW5.copyWith(fontSize: 16.spMin))
      ],
    );
  }
}
