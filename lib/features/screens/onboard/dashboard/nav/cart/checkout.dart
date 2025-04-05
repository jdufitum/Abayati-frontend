import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/core/services/stripe.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/home/details.dart';
import 'package:abayati/features/utils/app_color.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:abayati/features/utils/components/app_snackbar.dart';
import 'package:abayati/features/utils/constants.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:abayati/features/utils/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/model/response/product.dart';
import '../../../../../core/services/service/product/bloc/product_bloc.dart';

class Checkout extends HookWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    var cardFieldInputDetails = useState<CardFieldInputDetails?>(null);
    final order = ModalRoute.settingsOf(context)?.arguments as Orders;
    return Scaffold(
      appBar: showBackAppBar(context, title: 'Checkout'),
      body: BlocConsumer<ProductBloc, ProductState>(
        bloc: globals.productBloc,
        listener: (context, state) {
          if (state is PaymentSuccess) {
            globals.productBloc!.add(CartEvent());
            showSuccessDialog(context);
          }
          if (state is PaymentError) {
            AppSnackbar.error(context, message: state.error);
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h(30),
              PriceTile(
                title: 'Order',
                price: '${order.totalAmount} QR',
              ),
              h(18),
              const PriceTile(
                title: 'Shipping',
                price: '50 QR',
              ),
              h(18),
              PriceTile(
                title: 'Total',
                price: '${order.totalAmount! + 50} QR',
              ),
              const HDivider(),
              h(28),
              Text('Payment',
                  style: Montserrat.kFontW5.copyWith(fontSize: 18.spMin)),
              h(10),
              CardField(
                onCardChanged: (details) {
                  cardFieldInputDetails.value = details;
                },
              ),
              // const PaymentTile(provider: Images.visa),
              // const PaymentTile(provider: Images.maestro),
              // const PaymentTile(provider: Images.signInApple),
              h(37),
              AppButton(
                  enabled: cardFieldInputDetails.value?.complete ?? false,
                  loading: state is PaymentsLoading,
                  onPressed: () {
                    globals.productBloc!.add(PaymentsEvent(orderId: order.id!));
                  },
                  text: 'Continue')
            ],
          );
        },
      ).eHPad(40),
    );
  }

  Future<dynamic> showSuccessDialog(BuildContext context) {
    return showDialog(
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
                          style:
                              Montserrat.kFontW5.copyWith(fontSize: 18.spMin))
                    ],
                  ),
                ),
              ),
            )).then((_) {
      Navigator.popUntil(context, (route) => route.isFirst);
    });
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
