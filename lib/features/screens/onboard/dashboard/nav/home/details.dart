import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../assets/resources.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/text_style.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> coloring = [
      AppColor.k912C25,
      AppColor.k1A4E7D,
      AppColor.k313F59,
      AppColor.k9C3EAF
    ];
    List<String> sizing = ['XS', 'S', 'M', 'L', 'XL'];
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: showBackAppBar(context, title: 'Details'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 222.h,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(4.r)),
                      image: const DecorationImage(
                          image: AssetImage(Images.abaya105),
                          fit: BoxFit.cover)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 15.w, top: 6.h),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: AppColor.kF5F3F3,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: SvgPicture.asset(Vectors.fav),
                  ),
                )
              ],
            ),
            h(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text('Crescent Moon Abaya',
                          style:
                              Montserrat.kFontW5.copyWith(fontSize: 20.spMin)),
                    ),
                    w(3),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 25,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: AppColor.kEDB310,
                      ),
                      onRatingUpdate: (rating) {},
                    )
                  ],
                ),
                h(3),
                Text('Abaya corner',
                    style: Montserrat.kFontW5.copyWith(fontSize: 12.spMin)),
                Text(
                    'Abayas with moon designs blend elegance with celestial beauty, symbolizing mystery and grace. Featuring intricate moon patterns, they add a unique, artistic touch to traditional attire, perfect for evening wear or special occasions.',
                    style: Montserrat.kFontW4.copyWith(fontSize: 10.spMin)),
                h(12),
                Text('800 QR',
                    style: Montserrat.kFontW5.copyWith(fontSize: 16.spMin)),
                h(12),
                Text('Coloring',
                    style: Montserrat.kFontW4.copyWith(fontSize: 16.spMin)),
                h(10),
                Wrap(
                  spacing: 8.w,
                  children:
                      coloring.map((color) => Coloring(color: color)).toList(),
                ),
                const HDivider(),
                AppButton(
                  onPressed: () {},
                  text: '3D Try On',
                  buttonColor: AppColor.kD4A384,
                  fontStyle: FontStyle.italic,
                ),
                const HDivider(),
                Text('Sizing',
                    style: Montserrat.kFontW4.copyWith(fontSize: 16.spMin)),
                h(3),
                Wrap(
                  spacing: 9.w,
                  children: sizing.map((size) => Sizing(size: size)).toList(),
                ),
                h(10),
                Text('Click here for sizing guide',
                    style: Montserrat.kFontW4.copyWith(
                        fontSize: 12.spMin,
                        color: AppColor.k9C6644,
                        fontStyle: FontStyle.italic)),
                const HDivider(),
                Text('Notes',
                    style: Montserrat.kFontW4.copyWith(fontSize: 16.spMin)),
                h(3),
                TextField(
                  maxLines: 5,
                  cursorColor: AppColor.k9C6644,
                  style: Montserrat.kFontW4,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Write your note here...',
                    fillColor: AppColor.kD9D9D9,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide.none),
                    hintStyle: Montserrat.kFontW4.copyWith(
                        color: AppColor.kBBBBBB,
                        overflow: TextOverflow.visible),
                  ).copyWith(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h)),
                ),
                const HDivider(),
                Text('This order will approximately take 2-3 weeks',
                    style: Montserrat.kFontW7.copyWith(
                        fontSize: 12.spMin,
                        color: AppColor.k9C6644,
                        fontStyle: FontStyle.italic)),
                h(7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Quantity',
                        style: Montserrat.kFontW7.copyWith(
                            fontSize: 17.spMin, fontStyle: FontStyle.italic)),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 6.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: AppColor.kD9D9D9),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_drop_up_rounded,
                            color: AppColor.k9E9D9D,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 8.w),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(4.r)),
                            child: Text(
                              '1',
                              style: Montserrat.kFontW4
                                  .copyWith(fontSize: 15.spMin),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: AppColor.k9E9D9D,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                h(7),
                AppButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.cart,
                        arguments: true);
                  },
                  text: 'Add to Basket',
                  fontStyle: FontStyle.italic,
                ),
                h(20)
              ],
            ).eHPad(14)
          ],
        ),
      ),
    );
  }
}

class HDivider extends StatelessWidget {
  const HDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Divider(
          color: AppColor.kD8D6D6, height: 0, indent: 5.w, endIndent: 5.w),
    );
  }
}

class Sizing extends StatelessWidget {
  const Sizing({
    super.key,
    required this.size,
  });

  final String size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 56.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColor.kD9D9D9, borderRadius: BorderRadius.circular(4.r)),
      child: Text(size,
          style: Montserrat.kFontW4.copyWith(
              letterSpacing: -0.41,
              fontSize: 12.spMin,
              fontStyle: FontStyle.italic)),
    );
  }
}

class Coloring extends StatelessWidget {
  const Coloring({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(2),
      height: 22.h,
      width: 22.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.kD9D9D9, width: 2),
          color: color),
    );
  }
}
