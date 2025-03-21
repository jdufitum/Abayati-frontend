import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../assets/resources.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/text_style.dart';
import '../home/home.dart';

class SearchAi extends StatelessWidget {
  const SearchAi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // h(12),
            // const CustomAppBar(),
            h(21),
            const SearchContainer(),
            h(9),
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

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r), color: AppColor.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: TextField(
              cursorColor: AppColor.k9C6644,
              style: Montserrat.kFontW4,
              minLines: null,
              maxLines: null,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration.collapsed(
                hintStyle: Montserrat.kFontW4.copyWith(
                    color: AppColor.kBBBBBB, overflow: TextOverflow.visible),
                hintText:
                    'Let me help you find your perfect abaya. All you have to do is describe it to me. ',
              ).copyWith(
                  hintMaxLines: 2,
                  prefixIcon: SvgPicture.asset(Vectors.searchAi,
                      fit: BoxFit.scaleDown)),
            ),
          ),
        ],
      ),
    );
  }
}
